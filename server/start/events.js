'use strict'
const Event = use('Event')

// Event.on('user::sendMailNewAccount', 'User.sendMailNewAccount')
// Event.on('user::sendMailChangePassword', 'User.sendMailChangePassword')
// Event.on('user::sendMailDisabledAccount', 'User.sendMailDisabledAccount')
// Event.on('user::sendMailDeleteAccount', 'User.sendMailDeleteAccount')
let defined = ["User"]
defined.forEach(file => {
    let res = use('App/Listeners/' + file)
    Object.keys(res).map(key => Event.on(`user::${key}`, `${file}.${key}`));
});