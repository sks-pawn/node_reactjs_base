'use strict'

const Message = use('App/Constants/Message')

class ParamIsExits {
  get rules() {
    return {
      // validation rules
      id: 'required|number|exists:users,id'
    }
  }

  get data() {
    const { id } = this.ctx.params
    return Object.assign({}, { id })
  }

  get messages() {
    return {
      'id.required': Message.VALIDATE_REQUIRED,
      'id.number': Message.VALIDATE_NUMBNUMBER,
      'id.exists': Message.DATA_NOT_EXITS
    }
  }

  async fails(errorMessages) {
    this.ctx.response.BadValidatorException(errorMessages)
  }
}

module.exports = ParamIsExits
