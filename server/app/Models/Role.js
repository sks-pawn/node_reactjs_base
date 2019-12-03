'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Role extends Model {
    relaUser() {
        return this.hasMany('App/Models/User', 'id', 'role')
    }
}

module.exports = Role
