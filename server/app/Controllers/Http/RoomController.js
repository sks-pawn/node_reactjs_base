'use strict';
const uuidv4 = require('uuid/v4');
const Room = use('App/Models/Room');
const { broadcast } = use('App/Helpers/WebSocket');
const Antl = use('Antl')
const Status = use('App/Constants/Status')
const { LoggerPermanentException } = use('App/Helpers/Loggers')

class RoomController {
    async select({ params, response }) {
        const room = await Room
            .query()
            .where('uuid', params.id)
            .with('messages')
            .first();
        if (!room) {
            return response.notFound(`The room doesn't exist`)
        }
        return room;
    }

    async create({ request, response }) {
        try {
            let room = new Room();
            let uuid = uuidv4();
            room.uuid = uuid;
            await room.save();
            let result = await Room.findBy('uuid', uuid)
            return response.sucessResponseFn(result.toJSON());
        } catch (error) {
            LoggerPermanentException(error, request, request.post())
            return response.badResponseExceptionFn(request.post(), error.message);
        }
    }

    async createMessage({ params, request, response }) {
        const room = await Room.find(params.id);
        if (!room) {
            return response.notFound(`The room doesn't exist`)
        }

        const data = request.only(['name', 'message']);
        const message = await room.messages().create(data);

        // send the message upon new message creation
        // define a type for the frontend app - "room:newMessage"
        broadcast(room.uuid, 'room:newMessage', message);

        return message
    }
}

module.exports = RoomController;