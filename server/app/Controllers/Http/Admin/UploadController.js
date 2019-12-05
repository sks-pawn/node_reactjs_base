'use strict'
const Helpers = use('Helpers')
const { Upload } = use('App/Constants/Specialize')

class UploadController {
    async avatar({ request, response }) {
        try {
            const profilePic = request.file('image', {
                types: ['image'],
                size: Upload.IMAGE_SIZE_MAX.number
            })

            await profilePic.move(Helpers.tmpPath('uploads'), {
                name: profilePic.filename,
                overwrite: true
            })
            if (!profilePic.moved()) {
                return response.badUploadExceptionFn(profilePic.error())
            }
            return 'File moved'
        } catch (error) {
            throw error
        }
    }
}

module.exports = UploadController
