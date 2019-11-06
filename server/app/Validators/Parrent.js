'use strict'

const Message = use('App/Constants/Message')
class StoreUser {
    get validateAll() {
        return true
    }

    // xác định tên đầu vào rules
    get sanitizationRules() {
        return {
            email: 'normalize_email',
            password: 'to_int'
        }
    }

    get rules() {
        return {
            // validation rules
            email: 'required|email',
            password: 'required',
            post_id: 'required|exists:posts,id'
        }
    }

    // check thêm 1 số case ngooài body: ví dụ sessionId ở header
    get data() {
        const requestBody = this.ctx.request.post()
        const sessionId = this.ctx.request.header('X-Session-Id')
        return Object.assign({}, requestBody, { sessionId, post_id: 1 })
    }

    get messages() {
        return {
            'email.required': Message.VALIDATE_REQUIRED,
            'email.email': Message.VALIDATE_EMAIL,
            'email.unique': Message.VALIDATE_EMAIL_UNIQUE,
            'password.required': Message.VALIDATE_REQUIRED
        }
    }

    async authorize() {
        const authorize = this.ctx.request.header('Authorization');
        if (!authorize) {
            this.ctx.response.unauthorized(Message.ACCOUNT_NOT_AUTHORIZED)
            return false
        }
        return true
    }

    async fails(errorMessages) {
        return this.ctx.response.json(errorMessages)
    }
}

module.exports = StoreUser
