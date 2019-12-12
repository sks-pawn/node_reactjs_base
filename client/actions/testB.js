import * as TYPES from '~/constants/ActionType'
import callApi from '~/ultils/apiCaller'

module.exports = {
    functionTestB: () => {
        return (dispatch) => {
            return callApi('/products', 'GET', null).then(result => {
                let { data } = result
                // dispatch(actFetchProducts(data))
            })
        }
    }
}