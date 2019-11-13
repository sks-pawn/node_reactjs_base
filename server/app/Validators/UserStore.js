'use strict'

const Message = use('App/Constants/Message')
const { BadResponseException } = use('App/Helpers/Responses')

class UserStore {
  get validateAll() {
    return true
  }

  get rules() {
    return {
      // validation rules
      email: 'required|email|notExists:users,email',
      password: 'required'
    }
  }

  get messages() {
    return {
      'email.required': Message.VALIDATE_REQUIRED,
      'email.email': Message.VALIDATE_EMAIL,
      'email.notExists': Message.VALIDATE_EMAIL_UNIQUE,
      'password.required': Message.VALIDATE_REQUIRED
    }
  }

  async fails(errorMessages) {
    return BadResponseException(this.ctx.response, errorMessages)
  }
}

module.exports = UserStore
