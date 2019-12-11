'use strict'
const { LoggerPermanentWs } = use('App/Helpers/Loggers')

class RoomUpdateController {
  constructor({ socket, request }) {
    this.socket = socket
    this.request = request
    console.log('A new subscription for room topic', socket.topic)
  }

  onClose() {
    // same as: socket.on('close')
    console.log('Closing subscription for room topic', this.socket.topic)
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