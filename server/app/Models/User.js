'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class User extends Model {
  static boot() {
    super.boot()

    /**
     * A hook to hash the user password before saving
     * it to the database.
     */
    this.addHook('beforeSave', 'UserHook.hashPassword')
  }
  static get hidden() {
    return ['password']
  }
  static get computed() {
    return ['fullname']
  }
  /**
    * Getter
    */
  // getEmail(email) {
  //   return email.toUpperCase()
  // }
  getFullname({ first_name, last_name }) {
    return `${first_name} ${last_name}`
  }

  /**
    * Setter
    */
  // setAccess(access) {
  //   return access === 'admin' ? 1 : 0
  // }

  /**Query Scopes */
  static scopeHasRelaRole(query) {
    return query.has('relaRole')
    /**
      * Usage: 
      * Tìm tất cả user có role.
      * // await User.query().hasRelaRole().fetch()
      */
  }

  /**
   * A relationship on tokens is required for auth to
   * work. Since features like `refreshTokens` or
   * `rememberToken` will be saved inside the
   * tokens table.
   *
   * @method tokens
   *
   * @return {Object}
   */
  tokens() {
    return this.hasMany('App/Models/Token')
  }
  relaRole() {
    /**
      * Usage: 
      * Get role tương ứng user.
      * // await user.relaRole().fetch()
      * or
      * await user.load('relaRole')
      */
    return this.hasOne('App/Models/Role', 'role', 'id')
  }
  relaSchedules() {
    return this.hasMany('App/Models/Schedule')
  }
  relaCars() {
    return this.belongsToMany('App/Models/Car')
      .pivotTable('users_cars')
      .withPivot(['status'])
  }
}

module.exports = User
