const { ServiceProvider } = require('@adonisjs/fold')
const _ = require('lodash')

class CustomRequestProvider extends ServiceProvider {
    boot() {
        const Antl = use('Antl')
        const Request = use('Adonis/Src/Request')
        // Adonis/Src/Response
        // Adonis/Src/Request
        // Adonis/Src/HttpContext
        // Adonis/Src/Route

        Request.getter('GetTime', function () {
            return Antl.formatDate(new Date())
        })
        Request.getter('HasBody', function () {
            return !_.isEmpty(this.all())
        })
        Request.getter('GetBodyArray', function () {
            if (!_.isEmpty(this.all())) return _.map(this.all(), val => val);
            return null
        })
    }
}

module.exports = CustomRequestProvider