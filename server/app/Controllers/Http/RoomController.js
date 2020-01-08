'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

'use strict';
const uuidv4 = require('uuid/v4');
const Room = use('App/Models/Room');
const { broadcast } = use('App/Helpers/WebSocket');
const Antl = use('Antl')
const Status = use('App/Constants/Status')
const { LoggerPermanentException } = use('App/Helpers/Loggers')

/**
 * Resourceful controller for interacting with rooms
 */
class RoomController {
  /**
   * Show a list of all rooms.
   * GET rooms
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async index({ request, response }) {
    try {
      let rooms = await Room.all()
      return response.sucessResponseFn(rooms.toJSON());
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      return response.badResponseExceptionFn(request.post(), error.message);
    }
  }

  /**
   * Render a form to be used for creating a new room.
   * GET rooms/create
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async create({ request, response, view }) {
  }

  /**
   * Create/save a new room.
   * POST rooms
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store({ request, response }) {
    try {
      let room = new Room();
      let uuid = uuidv4();
      room.uuid = uuid;
      await room.save();
      let result = await Room.find(uuid)
      return response.sucessResponseFn(result.toJSON());
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      return response.badResponseExceptionFn(request.post(), error.message);
    }
  }

  /**
   * Display a single room.
   * GET rooms/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show({ params, request, response }) {
    try {
      let room = await Room
        .query()
        .where('uuid', params.id)
        .with('relaMessages')
        .first();
      if (!room) {
        return response.notFoundFn(`The room doesn't exist`)
      }
      return response.sucessResponseFn(room.toJSON());
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      return response.badResponseExceptionFn(request.post(), error.message);
    }
  }

  /**
   * Render a form to update an existing room.
   * GET rooms/:id/edit
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async edit({ params, request, response, view }) {
  }

  /**
   * Update room details.
   * PUT or PATCH rooms/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update({ params, request, response }) {
  }

  /**
   * Delete a room with id.
   * DELETE rooms/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy({ params, request, response }) {
  }

  async createMessage({ params, request, response }) {
    try {
      let room = await Room.find(params.id)
      if (!room) {
        return response.notFoundFn(`The room doesn't exist`)
      }

      let data = request.only(['name', 'message']);
      let message = await room.relaMessages().create(data);
      // send the message upon new message creation
      // define a type for the frontend app - "room:newMessage"
      broadcast(room.uuid, 'room:newMessage', message.toJSON());
      return response.sucessResponseFn(message.toJSON());
    } catch (error) {
      LoggerPermanentException(error, request, request.post())
      return response.badResponseExceptionFn(request.post(), error.message);
    }
  }
}

module.exports = RoomController