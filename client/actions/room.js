import * as TYPES from '~/constants/ActionType'
import callApi from '~/ultils/apiCaller'

module.exports = {
    ROOM_CREATE: async () => {
        return callApi.post('/rooms');
    },
    ROOM_FETCH: async uuid => {
        return callApi.get(`/rooms/${uuid}`);
    },
    MESSAGE_POST: async (uuid, data) => {
        return callApi.post(`/rooms/${uuid}`, data);
    }
}