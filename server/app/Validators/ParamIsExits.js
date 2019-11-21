'use strict'
const Antl = use('Antl')

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
      'id.required': Antl.formatMessage('messages.VALIDATE_REQUIRED'),
      'id.number': Antl.formatMessage('messages.VALIDATE_NUMBNUMBER'),
      'id.exists': Antl.formatMessage('messages.DATA_NOT_EXITS')
    }
  }

  async fails(errorMessages) {
    this.ctx.response.BadValidatorException(errorMessages)
  }
}

module.exports = ParamIsExits
