'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

const Database = use('Database')
const Status = use('App/Constants/Status')
const Message = use('App/Constants/Message')
const { LoggerPermanentException } = use('App/Helpers/Loggers')
const { BadResponseException, SucessResponse } = use('App/Helpers/Response')
const User = use('App/Models/User')
/**
 * Resourceful controller for interacting with users
 */
class UserController {
  /**
   * Show a list of all users.
   * GET users
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async index({ request, response, session }) {
    var cartTotal = request.cookie('cartTotal')
    response
      .cookie('cartTotal', 50)
    response
      .status(Status.Created)
      .json({ greeting: 'Hello world in JSON' })
  }

  /**
   * Render a form to be used for creating a new user.
   * GET users/create
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async create({ request, response, view }) {
  }

  /**
   * Create/save a new user.
   * POST users
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store({ request, response }) {
    try {
      let body = request.post()
      // let data = await Database.table('users').insert(body)
      let data = await new User().save(body)
      return SucessResponse(response, data, null, Status.Created);
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      throw error
    }
  }

  /**
   * Display a single user.
   * GET users/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show({ auth, params, request, response }) {
    try {
      let { id } = params
      if (auth.user.role === 1) return SucessResponse(response, auth.user); //ADMIN
      if (auth.user.id !== Number(id)) {
        return BadResponseException(response, { id }, Message.PROFILE_SEE_ERROR);
      }
      return SucessResponse(response, auth.user);
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      throw error
    }
  }

  /**
   * Render a form to update an existing user.
   * GET users/:id/edit
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async edit({ params, request, response, view }) {
  }

  /**
   * Update user details.
   * PUT or PATCH users/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update({ params, request, response, auth }) {
    try {
      let { id } = params;
      let body = request.post()
      //ADMIN hoặc chính nó
      if (auth.user.role === 1 || auth.user.id === Number(id)) {
        let update = await Database
          .table('users')
          .where('id', id)
          .update(body)
        if (auth.user.id === Number(id)) {
          // chính nó thì reset jwt
          let jwt = await auth.withRefreshToken().generate(auth.user)
          return SucessResponse(response, { jwt, update });
        }
        return SucessResponse(response, { update });
      }
      return BadResponseException(response, { id }, Message.PROFILE_UPDATE_ERROR);
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      throw error
    }
  }

  /**
   * Delete a user with id.
   * DELETE users/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy({ params, request, response }) {
    let { id } = params;
  }

  async login({ auth, request, response }) {
    try {
      let { email, password } = request.post()
      let jwt = await auth.withRefreshToken().attempt(email, password)
      return SucessResponse(response, jwt);
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      throw error
    }
  }
}

module.exports = UserController
