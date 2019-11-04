import axios from 'axios';
import _ from 'lodash';

const baseHeaders = {
    'X-Custom-Header': 'foobar'
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
                'Authorization': process.env.APP_KEY + "-" + accessToken,
            } : {
                    'Client-ID': clientId,
                }),
            ...baseHeaders,
            ...headers,
        }, item => !_.isEmpty(item))
    }).catch((e) => {
        // if (e.response && e.response.json) {
        //     e.response.json().then((json) => {
        //         if (json) throw json;
        //         throw e;
        //     });
        // } else {
        //     throw e;
        // }
        throw e;
    })
};