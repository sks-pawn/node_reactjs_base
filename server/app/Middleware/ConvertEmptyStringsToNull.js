'use strict'
/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

class ConvertEmptyStringsToNull {
  /**
 * @param {object} ctx
 * @param {Request} ctx.request
 * @param {Function} next
 */
  async handle({ request }, next) {
    // call next to advance the request
    if (Object.keys(request.body).length) {
      request.body = Object.assign(
        ...Object.keys(request.body).map(key => ({
          [key]: request.body[key] ? request.body[key] : null
        }))
      )
    }

    await next()
  }
}

module.exports = ConvertEmptyStringsToNull
