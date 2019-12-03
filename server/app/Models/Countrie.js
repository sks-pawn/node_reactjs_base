'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Countrie extends Model {
    relaUsers() {
        return this.hasMany('App/Models/User')
    }
    relaPosts() {
        return this.manyThrough('App/Models/User', 'relaPosts')
    }
}

module.exports = Countrie
