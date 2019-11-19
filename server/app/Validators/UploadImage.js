'use strict'
const { Upload } = use('App/Constants/Specialize')

class UploadFile {
    get rules() {
        return {
            image: `file|file_size:${Upload.IMAGE_SIZE_MAX.number}|file_types:image`
        }
    }

    async fails(errorMessages) {
        return this.ctx.response.BadUploadException(errorMessages)
    }
}

module.exports = UploadFile