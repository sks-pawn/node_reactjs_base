

const { hooks } = require('@adonisjs/ignitor')

hooks.after.providersRegistered(() => {
    const Validator = use('Validator')
    const Database = use('Database')

    // use when updating 
    const existsFn = async (data, field, message, args, get) => {
        const value = get(data, field)
        if (!value) {
            /**
             * skip validation if value is not defined. `required` rule
             * should take care of it.
            */
            return
        }
        const [table, column] = args
        const row = await Database.table(table).where(column, value).first();
        if (!row) {
            throw message
        }
    }

    // use when initialization 
    const notExistsFn = async (data, field, message, args, get) => {
        const value = get(data, field)
        if (!value) {
            /**
             * skip validation if value is not defined. `required` rule
             * should take care of it.
            */
            return
        }
        const [table, column] = args
        const row = await Database.table(table).where(column, value).first();
        if (row) {
            throw message
        }
    }

    Validator.extend('exists', existsFn)
    Validator.extend('notExists', notExistsFn)


    // Database.on('query', console.log)
})