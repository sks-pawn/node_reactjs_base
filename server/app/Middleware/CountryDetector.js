'use strict'
/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

const geoip = require('geoip-lite');

class CountryDetector {
  /**
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Function} next
   */
  async handle({ request }, next) {
    // call next to advance the request
    const ip = request.ip()
    request.addressIp = geoip.lookup(ip) ? geoip.lookup(ip) : null;
    await next()
  }
}

module.exports = CountryDetector
