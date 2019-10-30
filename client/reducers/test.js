import * as TYPES from '~/constants/ActionType'
const initialState = []

export default (state = initialState, { type, data }) => {
    switch (type) {
        case TYPES.TICK:
            return [...data]
        default:
            return [...state]
    }
}