const actions = [
    'TICK',
    'INCREMENT',
    'DECREMENT',
    'RESET'
]

actions.forEach(element => {
    exports[element] = element
})