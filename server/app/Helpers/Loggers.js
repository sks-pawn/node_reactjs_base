const Logger = use('Logger')

const LoggerCustom = {
    LoggerPermanent(error, request, data = null) {
        Logger.error(error.message, { url: request.url() })
        Logger.transport('file').error(error.message, {
            timestamp: new Date().toLocaleString(),
            url: request.url(),
            data: data,
            addressIp: request.addressIp
        })
    }
}


module.exports = LoggerCustom