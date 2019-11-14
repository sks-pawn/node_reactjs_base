'use strict'

const Message = use('App/Constants/Message')
const { BadValidatorException } = use('App/Helpers/Response')

class ParamIsNumber {
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
    return BadValidatorException(this.ctx.response, errorMessages)
  }
}

module.exports = ParamIsNumber
