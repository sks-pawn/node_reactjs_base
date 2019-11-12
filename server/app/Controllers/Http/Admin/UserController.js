'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */
const Status = use('App/Constants/Status')
const { LoggerPermanent } = use('App/Helpers/Loggers')
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
    const body = request.post()
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
      return await auth.listTokens()

      // const { email, password } = { 'email': 'admin@gmail.com', 'password': '123123' }
      // await auth.attempt(email, password)
      // return await auth.getUser()
    } catch (error) {
      throw error
    }
    // console.log('session :', session.all());
    // const { id } = params;
    // console.log('auth.user :', auth.user.id);
    // if (auth.user.id !== Number(id)) {
    //   return "You cannot see someone else's profile"
    // }
    // return auth.user
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
    const { id } = params;
    const body = request.post()
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
    const { id } = params;
  }

  async login({ auth, request, response, session }) {
    try {

      const { email, password } = request.post()
      var b = await auth.withRefreshToken().attempt(email, password)
      return await auth.newRefreshToken().generateForRefreshToken(b.refreshToken)
      // const user = await User.find(3)
      // return await auth.generate(user, true)
      // return auth.user

    } catch (error) {
      LoggerPermanent(error, request, request.post())
      throw error
    }
  }
}

module.exports = UserController
