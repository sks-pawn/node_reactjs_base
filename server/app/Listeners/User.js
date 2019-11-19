'use strict'
const { SendMail } = use('App/Helpers/Mail')
const User = exports = module.exports = {}

User.registered = async user => {
    user.attachPath = 'pdf/getting-startd.pdf'
    user.attachFilename = 'Getting Started'
    user.views = 'emails.register'
    await SendMail(user)
}
