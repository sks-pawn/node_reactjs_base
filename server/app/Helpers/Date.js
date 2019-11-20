const Antl = use('Antl')

module.exports = {
    DateTime = () => {
        return Antl.formatDate(new Date())
    },
    WeekdayLong = () => {
        return Antl.formatDate(new Date(), {
            weekday: 'long'
        })
    },
    MonthLong = () => {
        return Antl.formatDate(new Date(), {
            month: 'long'
        })
    },
    EraLong = () => {
        return Antl.formatDate(new Date(), {
            era: 'long'
        })
    },
    DateRelative = (time) => {
        // new Date(year, month, day, hours, minutes, seconds, milliseconds)
        return  Antl.formatRelative(new Date())
    }
}