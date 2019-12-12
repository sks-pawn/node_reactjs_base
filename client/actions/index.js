import callApi from '~/ultils/apiCaller'
import testA from './testA'
import testB from './testB'
import room from './room'

module.exports = {
    ...{
        API_HEALTHCHECK: () => {
            callApi.get('/', null, false);
        }
    }, ...testA, ...testB, ...room
} 
