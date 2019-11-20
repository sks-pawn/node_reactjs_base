'use strict'
const Antl = use('Antl')
const Formats = use('Antl/Formats')

Formats.add('usd', {
    style: 'currency',
    currency: 'usd'
})

class LocaleController {
    async getLocale() {
        return Antl.formatMessage(
            'messages.total',
            { total: 20 },
            [Formats.pass('usd', 'number')]
        )
    }
}

module.exports = LocaleController