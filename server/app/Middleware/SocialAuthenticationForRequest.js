'use strict'
/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

class SocialAuthenticationForRequest {
    /**
     * @param {object} ctx
     * @param {Request} ctx.request
     * @param {Function} next
     */
    async handle({ request }, next) {
        // call next to advance the request
        let r = request.url()
        request.socialAuthen = r.slice(r.lastIndexOf("/") + 1).replace(/[.json]|[.html]/gi, "");
        await next()
    }
}
module.exports = SocialAuthenticationForRequest
