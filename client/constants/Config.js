let data = process.env.NODE_ENV === 'development' ? {
    protocol: process.env.SERVER_DEV_PROTOCOL,
    protocolWs: process.env.SERVER_DEV_PROTOCOL_WS,
    host: process.env.SERVER_DEV_HOST,
    port: process.env.SERVER_DEV_PORT
} : {
        protocol: process.env.SERVER_PRODUCT_PROTOCOL,
        protocolWs: process.env.SERVER_PRODUCT_PROTOCOL_WS,
        host: process.env.SERVER_PRODUCT_HOST,
        port: process.env.SERVER_PRODUCT_PORT
    }

module.exports = {
    URL_CONFIG: data,
    URL_HTTP: `${data.protocol}://${data.host}:${data.port}`,
    URL_WS: `${data.protocolWs}://${data.host}:${data.port}`
}