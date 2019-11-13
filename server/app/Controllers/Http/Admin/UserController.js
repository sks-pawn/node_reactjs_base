'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */
const Status = use('App/Constants/Status')
const Message = use('App/Constants/Message')
const { LoggerPermanent } = use('App/Helpers/Loggers')
const { BadResponseException, SucessResponse } = use('App/Helpers/Responses')
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
    let body = request.post()
    // console.log('body :', body);
    return body;
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
  async show({ auth, params, request, response, view, session }) {
    try {
      let id = { params }
      if (auth.user.id !== id) {
        return BadResponseException(response, Message.PROFILE_SEARCH_ERROR);
      }
      return SucessResponse(response, auth.user);
    } catch (error) {
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
    let { id } = params;
    let body = request.post()
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

  async login({ auth, request, response, session }) {
    try {
      let { email, password } = request.post()
      let jwt = await auth.withRefreshToken().attempt(email, password)
      return SucessResponse(response, jwt);
    } catch (error) {
      LoggerPermanent(error, request, request.post())
      throw error
    }
  }
}

module.exports = UserController
