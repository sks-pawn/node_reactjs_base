const Logger = use('Logger')

const LoggerCustom = {
    LoggerPermanentException(error, request, data = null) {
        Logger.error(error.message, { url: request.url() })
        Logger.transport('exception').error(error.message, {
            timestamp: new Date().toLocaleString(),
            method: request.method(),
            url: request.url(),
            data: data,
            addressIp: request.addressIp
        })
    },
    LoggerPermanentWs(error, data = null) {
        Logger.error(error.message)
        Logger.transport('exceptionWs').error(error.message, {
            timestamp: new Date().toLocaleString(),
            data: data
        })
    },
    LoggerPermanentBasic(error) {
        Logger.error(error.message)
        Logger.transport('basic').error(error.message, {
            timestamp: new Date().toLocaleString(),
            data: error
        })
    },
}


module.exports = LoggerCustom