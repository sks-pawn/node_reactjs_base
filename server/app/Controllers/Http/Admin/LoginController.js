'use strict'
const Antl = use('Antl')
const User = use('App/Models/User')
const { validate } = use('Validator')
const { LoggerPermanentException } = use('App/Helpers/Loggers')

class LoginController {
    async normal({ auth, request, response }) {
        let { email, password } = request.post()
        try {
            let jwt = await auth.query((builder) => {
                builder.where('status', true)
            }).withRefreshToken().attempt(email, password)
            return response.SucessResponse(jwt);
        } catch (error) {
            LoggerPermanentException(error, request, request.post())
            return response.BadResponseException(request.post(), error.message);
        }
    }

    async redirect({ ally }) {
        await ally.driver('facebook').redirect()
    }

    async callback({ ally, auth, request, response }) {
        try {
            const fbUser = await ally.driver('facebook').getUser()
            let userDetails = {
                login_source: 'facebook',
                first_name: fbUser.getName(),
                last_name: fbUser.getNickname(),
                avatar: fbUser.getAvatar(),
            }
            let whereClause = {
                email: fbUser.getEmail()
            }
            let rules = {
                email: 'required|email|unique:users,email'
            }
            let validation = await validate(whereClause, rules)
            let user;
            if (validation.fails()) {
                await User.query().where(whereClause).update(userDetails)
                user = await User.findBy(whereClause)
            } else {
                user = await User.create({
                    ...userDetails, ...{
                        email: fbUser.getEmail(),
                        role: 3,
                        status: 1
                    }
                })
            }
            if (!user.status) {
                return response.BadResponseException(null, Antl.formatMessage('messages.PROFILE_NOT_ACTIVE'));
            }
            let jwt = await auth.withRefreshToken().generate(user)
            return response.SucessResponse(jwt);
        } catch (error) {
            LoggerPermanentException(error, request, request.post())
            return response.BadResponseException(request.post(), Antl.formatMessage('messages.ACCOUNT_NOT_AUTHENTICATE'));
        }
    }
}

module.exports = LoginController