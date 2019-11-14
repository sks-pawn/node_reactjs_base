

const { hooks } = require('@adonisjs/ignitor')

const handleCheckExits = async (data, field, args, get) => {
    const Database = use('Database')
    let value = get(data, field)
    if (!value) {
        /**
         * skip validation if value is not defined. `required` rule
         * should take care of it.
        */
        return
    }
    let [table, column] = args
    let result = await Database.table(table).where(column, value).first();
    return result
}
hooks.after.providersRegistered(() => {
    const Validator = use('Validator')
    // use when updating if id data exits
    const existsFn = async (data, field, message, args, get) => {
        let row = await handleCheckExits(data, field, args, get)
        if (!row) {
            throw message
        }
    }

    // use when initialization 
    const notExistsFn = async (data, field, message, args, get) => {
        let row = await handleCheckExits(data, field, args, get)
        if (row) {
            throw message
        }
    }

    Validator.extend('exists', existsFn)
    Validator.extend('notExists', notExistsFn)

    // Database.on('query', console.log)
})