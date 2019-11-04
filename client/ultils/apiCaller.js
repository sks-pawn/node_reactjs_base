import ApiConfig from './config';

export default {
    get: (endPoint, payload, headers, fomats) => { return ApiConfig(endPoint, payload, 'GET', headers, fomats) },
    post: (endPoint, payload, headers, fomats) => { return ApiConfig(endPoint, payload, 'POST', headers, fomats) },
    put: (endPoint, payload, headers, fomats) => { return ApiConfig(endPoint, payload, 'PUT', headers, fomats) },
    patch: (endPoint, payload, headers, fomats) => { return ApiConfig(endPoint, payload, 'PATCH', headers, fomats) },
    delete: (endPoint, payload, headers, fomats) => { return ApiConfig(endPoint, payload, 'DELETE', headers, fomats) }
};
