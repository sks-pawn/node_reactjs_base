'use strict'

/** @type {import('@adonisjs/framework/src/Hash')} */
const Hash = use('Hash')
const UserHook = exports = module.exports = {}

UserHook.hashPassword = async (userInstance) => {
    if (userInstance.password) {
        userInstance.password = await Hash.make(userInstance.password)
    }
}

UserHook.validate = async (userInstance) => {
    if (!userInstance.username) {
        throw new Error('Username is required')
    }
}