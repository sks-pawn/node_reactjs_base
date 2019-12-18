const { ServiceProvider } = require('@adonisjs/fold')

class CustomResponseProvider extends ServiceProvider {
    boot() {
        const Response = use('Adonis/Src/Response')
        // Adonis/Src/Response
        // Adonis/Src/Request
        // Adonis/Src/HttpContext
        // Adonis/Src/Route

        Response.macro('badValidatorExceptionFn', function (data = null, message = "Error Validator", status = 400) {
            if (!message) message = "Error-Validator"
            if (!status) status = 400
            this.status(status).json({
                error: {
                    name: "Error-Validator",
                    message,
                    status,
                    data,
                    validate: true
                }
            })
        })

        Response.macro('badUploadExceptionFn', function (data = null, message = "Error Upload", status = 400) {
            if (!message) message = "Error-Upload"
            if (!status) status = 400
            this.status(status).json({
                error: {
                    name: "Error-Upload",
                    message,
                    status,
                    data,
                    upload: true
                }
            })
        })

        Response.macro('badResponseExceptionFn', function (data = null, message = "Error", status = 400) {
            if (!message) message = "Error"
            if (!status) status = 400
            this.status(status).json({
                error: {
                    name: "Error",
                    message,
                    status,
                    data
                }
            })
        })

        Response.macro('sucessResponseFn', function (data = null, message = "Sucess", status = 200) {
            if (!message) message = "Sucess"
            if (!status) status = 200
            this.status(status).json({
                success: {
                    name: "Sucess",
                    message,
                    status,
                    data
                }
            })
        })

        Response.macro('notFoundFn', function (message = "Not Found", status = 404) {
            this.status(status).json({
                error: {
                    name: "Error Not Found",
                    message,
                    status
                }
            })
        })
    }
}

module.exports = CustomResponseProvider