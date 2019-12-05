import ApiConfig from './config';

export default {
    get: (endPoint, payload, fomats, headers) => { return ApiConfig(endPoint, payload, 'GET', fomats, headers) },
    post: (endPoint, payload, fomats, headers) => { return ApiConfig(endPoint, payload, 'POST', fomats, headers) },
    put: (endPoint, payload, fomats, headers) => { return ApiConfig(endPoint, payload, 'PUT', fomats, headers) },
    patch: (endPoint, payload, fomats, headers) => { return ApiConfig(endPoint, payload, 'PATCH', fomats, headers) },
    delete: (endPoint, payload, fomats, headers) => { return ApiConfig(endPoint, payload, 'DELETE', fomats, headers) }
};
