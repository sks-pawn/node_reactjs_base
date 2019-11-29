'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Car extends Model {
    relaUser() {
        return this.belongsToMany('App/Models/User')
            .pivotTable('users_cars')
            .withPivot(['status'])
    }
}

module.exports = Car
