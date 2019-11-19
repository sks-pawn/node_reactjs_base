const { ServiceProvider } = require('@adonisjs/fold')

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

class CustomValidatorProvider extends ServiceProvider {
    boot() {
        const Validator = use('Validator')
        const Specialize = use('App/Constants/Specialize')

        // use when updating if id data exits
        const existsFn = async (data, field, message, args, get) => {
            let row = await handleCheckExits(data, field, args, get)
            if (!row) throw message
        }

        // use when initialization 
        const notExistsFn = async (data, field, message, args, get) => {
            let row = await handleCheckExits(data, field, args, get)
            if (row) throw message
        }

        const phoneFn = async (data, field, message, args, get) => {
            let value = get(data, field)
            if (!value) return
            let res = Specialize.Validator.phone.vn.test(value)
            if (!res) throw message
        }

        Validator.extend('exists', existsFn)
        Validator.extend('notExists', notExistsFn)
        Validator.extend('phone', phoneFn)
    }
}

module.exports = CustomValidatorProvider