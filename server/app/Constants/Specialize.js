let naPhone = /^[0-9]+$/;

module.exports = {
    Upload: {
        IMAGE_LENGTH_MAX: 950000,
        IMAGE_SIZE_MAX: {
            number: 512000,
            string: "500kb"
        },
        FILE_SIZE_MAX: {
            number: 2097152,
            string: "2mb"
        },
        VALID_IMAGE_TYPES: ['image/jpeg', 'image/png'],
        VALID_DOCUMENT_FILE_TYPES: [
            'image/gif',
            'application/pdf',
            'application/msword',
            'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            'application/vnd.ms-excel',
            'application/vnd.ms-powerpoint',
            'application/vnd.openxmlformats-officedocument.presentationml.presentation',
            'text/plain'
        ]
    },
    Validator: {
        phone: {
            us: naPhone,
            ca: naPhone,
            vn: /(09|0[3|5|7|8|9])+([0-9]{8})\b/,
            fr: /^0[1-6]{1}(([0-9]{2}){4})|((\s[0-9]{2}){4})|((-[0-9]{2}){4})$/,
            it: /^(([0-9]{2,4})([-\s\/]{0,1})([0-9]{4,8}))?$/,
            jp: /^(0\d{1,4}- ?)?\d{1,4}-\d{4}$/,
            cn: /.*/,
            tr: /^([^a-zA-Z]){1,20}$/,
            gb: /^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$/
        },
        postal: {
            us: /^\d{5}(-\d{4})?$/,
            ca: /^[abceghjklmnprstvxyABCEGHJKLMNPRSTVXY][0-9][A-Za-z] [0-9][A-Za-z][0-9]$/,
            fr: /^(F-)?((2[A|B])|[0-9]{2})[0-9]{3}$/,
            it: /^([0-9]){5}$/,
            jp: /^([0-9]){3}[-]([0-9]){4}$/,
            cn: /^([0-9]){6}$/,
            tr: /^([0-9]){5}$/,
            gb: /^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$/,
            number: /^[0-9]+$/,
            string: /^[a-zA-Z]+$/,
            alphanumeric: /^[a-zA-Z0-9 -]+$/
        },
        notCC: /^(?!(([0-9 -]){13,19})).*$/,
        email: /^[\w.%+-]+@[\w.-]+\.[\w]{2,6}$/
    }
}
