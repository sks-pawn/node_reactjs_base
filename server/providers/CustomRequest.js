const { ServiceProvider } = require('@adonisjs/fold')
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
    }
}

module.exports = CustomRequestProvider