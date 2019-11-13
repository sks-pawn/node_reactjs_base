const Resonse = {
    BadResponseException(response, data = null, message = "Error", status = 400) {
        return response.status(status).json({
            error: {
                message,
                status,
                data
            }
        })
    },
    SucessResponse(response, data = null, message = "Sucess", status = 200) {
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