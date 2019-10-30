import axios from 'axios';
import _ from 'lodash';

const baseHeaders = {
    'X-Custom-Header': 'foobar'
}
export default (endPoint, payload = {}, method = 'get', headers = {}) => {
    const URL = process.env.NODE_ENV === 'development' ?
        `${process.env.SERVER_DEV_PROTOCOL}://${process.env.SERVER_DEV_HOST}:${process.env.SERVER_DEV_PORT}` :
        `${process.env.SERVER_PRODUCT_PROTOCOL}://${process.env.SERVER_PRODUCT_HOST}:${process.env.SERVER_PRODUCT_PORT}`;
    var accessToken = 'AccessToken';
    let clientId = 'ClientId';
    return axios({
        method: method.toLowerCase(),
        data: payload,
        baseURL: [URL, endPoint].join(''),
        timeout: 30000,
        headers: _.pickBy({
            ...(accessToken ? {
                'Authorization': process.env.KEY_APP + "-" + accessToken,
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