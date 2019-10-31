import ApiConfig from './config';

export default {
    get: (endPoint, payload, headers) => { return ApiConfig(endPoint, payload, 'GET', headers) },
    post: (endPoint, payload, headers) => { return ApiConfig(endPoint, payload, 'POST', headers) },
    put: (endPoint, payload, headers) => { return ApiConfig(endPoint, payload, 'PUT', headers) },
    patch: (endPoint, payload, headers) => { return ApiConfig(endPoint, payload, 'PATCH', headers) },
    delete: (endPoint, payload, headers) => { return ApiConfig(endPoint, payload, 'DELETE', headers) }
};
