'use strict'

const User = exports = module.exports = {}
const Mail = use('Mail')

User.registered = async (user) => {
    console.log('user :', user);
    await Mail.send('emails.register', user, (message) => {
        message.to("thanhanh.nguyen@isobar.com")
        message.from('anhthanh1996vp@gmail.com')
    })
}
