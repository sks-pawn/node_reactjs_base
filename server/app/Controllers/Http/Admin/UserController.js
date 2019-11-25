'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

const Event = use('Event')
const Antl = use('Antl')
const Status = use('App/Constants/Status')
const User = use('App/Models/User')
const { LoggerPermanentException } = use('App/Helpers/Loggers')


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
  async index({ auth, request, response }) {
    try {
      if (auth.user.role === 1) {
        let users = await User.all()
        return response.SucessResponse(users);
      }
      return response.BadResponseException(null, Antl.formatMessage('messages.PROFILE_PERMISSION_ERROR'));
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      return response.BadResponseException(request.post(), error.message);
    }
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
      let user = await User.create(body)
      if (user) Event.fire('user::sendMailNewAccount', user)
      return response.SucessResponse(user, null, Status.Created);
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      return response.BadResponseException(request.post(), error.message);
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
      if (auth.user.role === 1) return response.SucessResponse(auth.user); //ADMIN
      if (auth.user.id !== Number(id)) {
        return response.BadResponseException({ id }, Antl.formatMessage('messages.PROFILE_SEE_ERROR'));
      }
      return response.SucessResponse(auth.user);
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      return response.BadResponseException(request.post(), error.message);
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
  async update({ auth, params, request, response }) {
    try {
      let { id } = params;
      let body = request.post()
      //ADMIN hoặc chính nó
      if (auth.user.role === 1 || auth.user.id === Number(id)) {
        let update = await User.query().where('id', id).update(body)
        if (body.password) {
          let user = await User.find(id)
          user.password = body.password
          await user.save()
        }
        return response.SucessResponse({ update });
      }
      return response.BadResponseException({ id }, Antl.formatMessage('messages.PROFILE_UPDATE_ERROR'));
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      return response.BadResponseException(request.post(), error.message);
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
  async destroy({ auth, params, request, response }) {
    try {
      let { id } = params;
      let data = request.post();
      let arr = id ? [id] : data.id
      if (auth.user.role === 1 || auth.user.id === Number(id)) {
        if (id || data.id.length) {
          let destroy = await User.query().whereIn('id', arr).update({ status: false })
          return response.SucessResponse(destroy);
        }
      }
      return response.BadResponseException({ id: arr }, Antl.formatMessage('messages.PROFILE_PERMISSION_ERROR'));
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      return response.BadResponseException(request.post(), error.message);
    }
  }

  async destroyForever({ auth, params, request, response }) {
    try {
      let { id } = params;
      let data = request.post();
      let arr = id ? [id] : data.id
      if (auth.user.role === 1 && (id || data.id.length)) {
        let destroy = await User.query().whereIn('id', arr).delete()
        return response.SucessResponse(destroy);
      }
      return response.BadResponseException({ id: arr }, Antl.formatMessage('messages.PROFILE_PERMISSION_ERROR'));
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      return response.BadResponseException(request.post(), error.message);
    }
  }
}

module.exports = UserController
