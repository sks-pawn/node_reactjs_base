import axios from 'axios';
import _ from 'lodash';
import { URL_HTTP } from '~/constants/Config'

const baseHeaders = {
    'Accept': 'application/json',
    'Accept-Language': 'en'
}

export default (endPoint, payload = {}, method = 'get', fomats = 'json', headers = {}) => {
    let token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTU3NDA2OTI1MSwiZXhwIjoxNTc0MDc2NDUxfQ.TWxlinbjI2yNoJQCqW_bFXyZJATCrhiNQY9H5O-nYwk';
    let clientId = 'ClientId';
    if (!fomats) fomats = ""
    else fomats = endPoint ? '.' + fomats : '/.' + fomats;
    return axios({
        method: method.toLowerCase(),
        data: payload,
        baseURL: [URL_HTTP, endPoint, fomats].join(''),
        timeout: 30000,
        headers: _.pickBy({
            ...(token ? {
                "Authorization": "Bearer " + token
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