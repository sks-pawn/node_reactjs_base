'use strict'

const Message = use('App/Constants/Message')
const { BadValidatorException } = use('App/Helpers/Response')

class UserStore {
  get validateAll() {
    return true
  }

  get rules() {
    const defined = {
      // validation rules
    }
    const userId = this.ctx.params.id
    //update
    if (userId) {
      return { ...defined, ...{} }
    }
    //create
    return {
      ...defined, ...{
        email: 'required|email|notExists:users,email',
        password: 'required',
        first_name: 'required',
        last_name: 'required',
        role: 'required',
        status: 'required|number',
        phone: 'required|notExists:users,phone',
        gender: 'required|number'
      }
    }
  }

  get messages() {
    return {
      'email.notExists': Message.VALIDATE_EMAIL_UNIQUE,
      'phone.notExists': Message.VALIDATE_PHONE_UNIQUE
    }
  }

  async fails(errorMessages) {
    return BadValidatorException(this.ctx.response, errorMessages)
  }
}

module.exports = UserStore
