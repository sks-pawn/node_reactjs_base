import * as TYPES from '~/constants/ActionType'
import callApi from '~/ultils/apiCaller'

module.exports = {
    ROOM_CREATE: async () => {
        return callApi.post('/rooms');
    },
    ROOM_FETCH: async id => {
        return callApi.get(`/rooms/${id}`);
    },
    MESSAGE_POST: async (data, id) => {
        return callApi.post(`/rooms/${id}`, data);
    }
}