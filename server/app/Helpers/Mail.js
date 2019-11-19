const Mail = use('Mail')
const Env = use('Env')
const Helpers = use('Helpers')
const { LoggerPermanentBasic } = use('App/Helpers/Loggers')

module.exports = {
    async SendMail(data) {
        try {
            await Mail.send(data.views, data, message => {
                message.to(data.email)
                message.from(Env.get('MAIL_FROM'))
                message.subject(Env.get('MAIL_SUBJECT'))
                if (data.attachPath) {
                    message.attach(Helpers.resourcesPath(data.attachPath), {
                        filename: data.attachFilename ? data.attachFilename : data.attachPath
                    })
                }
            })
        } catch (error) {
            LoggerPermanentBasic(error)
            return;
        }
    }
}