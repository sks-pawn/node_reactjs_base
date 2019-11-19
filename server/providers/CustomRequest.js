const { ServiceProvider } = require('@adonisjs/fold')

class CustomRequestProvider extends ServiceProvider {
    boot() {
        const Request = use('Adonis/Src/Request')
        // Adonis/Src/Response
        // Adonis/Src/Request
        // Adonis/Src/HttpContext
        // Adonis/Src/Route

        Request.getter('time', function () {
            return new Date().getTime()
        })
    }
}

module.exports = CustomRequestProvider