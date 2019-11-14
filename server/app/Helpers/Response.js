const Resonse = {
    BadValidatorException(response, data = null, message = "Error-Validator", status = 400) {
        if (!message) message = "Error-Validator"
        if (!status) status = 400
        return response.status(status).json({
            error: {
                message,
                status,
                data,
                validate: true
            }
        })
    },
    BadResponseException(response, data = null, message = "Error", status = 400) {
        if (!message) message = "Error"
        if (!status) status = 400
        return response.status(status).json({
            error: {
                message,
                status,
                data,
                validate: false
            }
        })
    },
    SucessResponse(response, data = null, message = "Sucess", status = 200) {
        if (!message) message = "Sucess"
        if (!status) status = 200
        return response.status(status).json({
            success: {
                message,
                status,
                data
            }
        })
    }
}


module.exports = Resonse;