'use strict'
const { LoggerPermanentWs } = use('App/Helpers/Loggers')

class RoomUpdateController {
  constructor({ socket, request }) {
    this.socket = socket
    this.request = request
  }

  onClose() {
    // same as: socket.on('close')
  }

  onError() {
    // same as: socket.on('error')
    // LoggerPermanentWs()
  }

  onMessage(message) {
    console.log('got message', message)
  }
}

module.exports = RoomUpdateController 