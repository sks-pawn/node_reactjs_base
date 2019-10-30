import Constants from '~/constants/index'

const getStringFromEncodeBase64 = (str) => {
    return str.split('base64,')[1];
}

export default readURL = (file) => {
    if (!file || (file && file.size === 0)) return false;
    var maxString = Constants.UPLOAD_IMAGE_SIZE_MAX;
    var maxMb = Constants.UPLOAD_FILE_SIZE_MAX;
    var validImageTypes = ['image/jpeg', 'image/png'];
    var validDocumentFileTypes = [
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
    var reader = new FileReader();

    if (file) {
        if ($.inArray(file.type, validImageTypes) != '-1') {
            var output = document.createElement('img');
            output.src = URL.createObjectURL(file);
            output.onload = function () {
                // check if image > 500kb then processing canvas image
                var maxDimension = 500;
                var dataURL = convertImageToBase64(output, maxDimension, file);
                var fileDataURL = getStringFromEncodeBase64(dataURL);
                if (fileDataURL.length >= maxString) {
                    do {
                        maxDimension -= 5
                        dataURL = convertImageToBase64(output, maxDimension, file);
                        fileDataURL = getStringFromEncodeBase64(dataURL);
                    } while (fileDataURL.length >= maxString);
                }
                var attachmentData = new Object({
                    'fileName': file.name,
                    'fileDataURL': fileDataURL,
                    'type': file.type
                });
                return JSON.stringify(attachmentData)
            }
        } else {
            if ($.inArray(file.type, validDocumentFileTypes) != -1) {
                return file.size < maxMb; //true
            }
            reader.readAsDataURL(file);
            reader.onload = function () {
                var attachmentData = new Object({
                    'fileName': file.name,
                    'fileDataURL': getStringFromEncodeBase64(reader.result),
                    'type': file.type
                });
                return JSON.stringify(attachmentData)
            };
            reader.onerror = function (error) {
                return error;
            };
        }
    }
}

const convertImageToBase64 = (output, maxDimension, file) => {
    var canvas = document.createElement('canvas'),
        ctx = canvas.getContext('2d');

    var arrayDimension = [output.width, output.height];
    var minDimension = Math.min.apply(Math, arrayDimension);
    if (minDimension === maxDimension && minDimension > 100) {
        maxDimension -= 100;
    }
    if (file.size > 500 * 1024 || (output.width > maxDimension || output.height > maxDimension)) {
        if (output.width > output.height) {
            canvas.width = maxDimension;
            canvas.height = canvas.width * (output.height / output.width);
        } else {
            canvas.height = maxDimension;
            canvas.width = canvas.height * (output.width / output.height);
        }
    } else {
        canvas.width = output.width;
        canvas.height = output.height;
    }
    ctx.drawImage(output, 0, 0, canvas.width, canvas.height);
    return canvas.toDataURL();
}