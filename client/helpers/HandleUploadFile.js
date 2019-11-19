import { Upload } from '~/constants/Specialize'

const getStringFromEncodeBase64 = (str) => {
    return str.split('base64,')[1];
}

export default readURL = (file) => {
    if (!file || (file && file.size === 0)) return false;
    let maxString = Upload.IMAGE_LENGTH_MAX;
    let maxMb = Upload.FILE_SIZE_MAX.number;
    let reader = new FileReader();

    if (file) {
        if ($.inArray(file.type, Upload.VALID_IMAGE_TYPES) != '-1') {
            let output = document.createElement('img');
            output.src = URL.createObjectURL(file);
            output.onload = function () {
                // check if image > 500kb then processing canvas image
                let maxDimension = 500;
                let dataURL = convertImageToBase64(output, maxDimension, file);
                let fileDataURL = getStringFromEncodeBase64(dataURL);
                if (fileDataURL.length >= maxString) {
                    do {
                        maxDimension -= 5
                        dataURL = convertImageToBase64(output, maxDimension, file);
                        fileDataURL = getStringFromEncodeBase64(dataURL);
                    } while (fileDataURL.length >= maxString);
                }
                let attachmentData = new Object({
                    'fileName': file.name,
                    'fileDataURL': fileDataURL,
                    'type': file.type
                });
                return JSON.stringify(attachmentData)
            }
        } else {
            if ($.inArray(file.type, Upload.VALID_DOCUMENT_FILE_TYPES) != -1) {
                return file.size < maxMb; //true
            }
            reader.readAsDataURL(file);
            reader.onload = function () {
                let attachmentData = new Object({
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
    let canvas = document.createElement('canvas'),
        ctx = canvas.getContext('2d');

    let arrayDimension = [output.width, output.height];
    let minDimension = Math.min.apply(Math, arrayDimension);
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