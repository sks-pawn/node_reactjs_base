const listTypes = [
    'TICK',
    'INCREMENT',
    'DECREMENT',
    'RESET'
]

listTypes.forEach(element => {
    exports[element] = element
})