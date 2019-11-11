import axios from 'axios';
import _ from 'lodash';

const baseHeaders = {
    'Accept': 'application/json'
}

const config = process.env.NODE_ENV === 'development' ? {
    protocol: process.env.SERVER_DEV_PROTOCOL,
    host: process.env.SERVER_DEV_HOST,
    port: process.env.SERVER_DEV_PORT
} : {
        protocol: process.env.SERVER_PRODUCT_PROTOCOL,
        host: process.env.SERVER_PRODUCT_HOST,
        port: process.env.SERVER_PRODUCT_PORT
    }

const URL = `${config.protocol}://${config.host}:${config.port}`

export default (endPoint, payload = {}, method = 'get', headers = {}, fomats = 'json') => {
    let accessToken = 'AccessToken';
    let clientId = 'ClientId';
    fomats = endPoint ? '.' + fomats : '/.' + fomats;
    return axios({
        method: method.toLowerCase(),
        data: payload,
        baseURL: [URL, endPoint, fomats].join(''),
        timeout: 30000,
        headers: _.pickBy({
            ...(accessToken ? {
                // 'Authorization': process.env.APP_KEY + "-" + accessToken,
                Authorization : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTU3MzQ2OTkyNCwibmJmIjoxNTczNTA1OTI0LCJleHAiOjE1NzM2NDI3MjR9.ZfPn5J4f45Q4xB3jP9g9EFA4CtKUvOwNPRvfqJHDQn8"
            } : {
                    'Client-ID': clientId,
                }),
            ...baseHeaders,
            ...headers,
        }, item => !_.isEmpty(item))
    }).catch((e) => {
        if (e.response) throw e.response;
        throw e;
    })
};