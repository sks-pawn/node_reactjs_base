'use strict'

const Message = use('App/Constants/Message')
const { BadResponseException } = use('App/Helpers/Response')

class ParamIsNumber {
  get rules() {
    return {
      // validation rules
      id: 'required|exists:users,id'
    }
  }

  get data() {
    const { id } = this.ctx.params
    if (Number(id)) {
      return Object.assign({}, { id })
    }
  }

  get messages() {
    return {
      'id.required': Message.VALIDATE_REQUIRED,
      'id.exists': Message.DATA_NOT_EXITS
    }
  }

  async fails(errorMessages) {
    return BadResponseException(this.ctx.response, errorMessages)
  }
}

module.exports = ParamIsNumber
