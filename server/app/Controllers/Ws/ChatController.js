'use strict'

class ChatController {
  constructor({ socket, request }) {
    console.log('a new subscription for news topic')
    this.socket = socket
    this.request = request
  }

  onMessage(message) {
    this.socket.broadcastToAll('message', message)
  }
}

module.exports = ChatController
