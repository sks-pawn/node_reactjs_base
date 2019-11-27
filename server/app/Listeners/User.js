'use strict'
const { SendMail } = use('App/Helpers/Mail')
const User = exports = module.exports = {}

User.sendMailNewAccount = async user => {
    await SendMail({
        ...user, ...{
            attachPath: 'img/custom-name.jpg',
            attachFilename: 'Getting Started',
            views: 'emails.register'
        }
    })
}
User.sendMailChangePassword = async user => {
    await SendMail({
        ...user, ...{
            attachPath: 'img/custom-name.jpg',
            attachFilename: 'Getting Started',
            views: 'emails.register'
        }
    })
}
User.sendMailDisabledAccount = async user => {
    await SendMail({
        ...user, ...{
            attachPath: 'img/custom-name.jpg',
            attachFilename: 'Getting Started',
            views: 'emails.register'
        }
    })
}
User.sendMailDeleteAccount = async user => {
    await SendMail({
        ...user, ...{
            attachPath: 'img/custom-name.jpg',
            attachFilename: 'Getting Started',
            views: 'emails.register'
        }
    })
}

