const { ServiceProvider } = require('@adonisjs/fold')

class CustomFormatsProvider extends ServiceProvider {
    boot() {
        const Formats = use('Antl/Formats')

        Formats.add('usd', {
            style: 'currency',
            currency: 'usd'
        })

        Formats.add('gbp', {
            style: 'currency',
            currency: 'gbp'
        })
    }
}

module.exports = CustomFormatsProvider