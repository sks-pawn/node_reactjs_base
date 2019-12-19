'use strict'
const { LoggerPermanentWs } = use('App/Helpers/Loggers')

class RoomUpdateController {
  constructor({ socket, request }) {
    this.socket = socket
    this.request = request
    console.log('A new subscription for room topic :: ', socket.topic)
  }

  onClose() {
    // same as: socket.on('close')
    console.log('Closing subscription for room topic :: ', this.socket.topic)
  }

  onError() {
    console.log('12321');
    // same as: socket.on('error')
    // LoggerPermanentWs()
  }

  onMessage(message) {
    console.log('Got message', message)
  }
}

module.exports = RoomUpdateController 