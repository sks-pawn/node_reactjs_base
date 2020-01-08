import * as TYPES from '~/constants/ActionType'
import callApi from '~/ultils/apiCaller'

module.exports = {
    ROOM_FETCH: async uuid => {
        return callApi.get(`/rooms`);
    },
    ROOM_SHOW: async uuid => {
        return callApi.get(`/rooms/${uuid}`);
    },
    ROOM_CREATE: async () => {
        return callApi.post('/rooms');
    },
    MESSAGE_POST: async (uuid, data) => {
        return callApi.post(`/rooms/${uuid}`, data);
    }
}