import axios from 'axios'
import * as Config from '../constants/Config'

const callApi = (endpoint, method = 'GET', data) => {
    return axios({
        method: method,
        url: Config.API_URL + endpoint,
        data: data
    }).catch(err => {
        throw err
    });
}

export default callApi