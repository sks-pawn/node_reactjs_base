'use strict'

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
        email: 'required|email|unique:users,email',
        password: 'required|string|max:255',
        first_name: 'required|string|max:255',
        last_name: 'required|string|max:255',
        role: 'required|number',
        status: 'required|number',
        phone: 'required|phone|unique:users,phone',
        gender: 'required|boolean'
      }
    }
  }

  async fails(errorMessages) {
    return this.ctx.response.BadValidatorException(errorMessages)
  }
}

module.exports = UserStore
