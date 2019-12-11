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
        let arr = [".json", ".html"]
        let url = request.url()
        request.socialAuthen = url.slice(url.lastIndexOf("/") + 1)
        arr.forEach(e => request.socialAuthen = request.socialAuthen.replace(e, ""))

        await next()
    }
}
module.exports = SocialAuthenticationForRequest
