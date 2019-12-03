// get Config 
const Config = use('Config').get('app.http.trustProxy')
console.log('appSecret :', appSecret);

// request and reponse 

const headers = request.headers()
const cookies = request.cookies()
const url = request.url()
const originalUrl = request.originalUrl()
const method = request.method()
const hostname = request.hostname()
const protocol = request.protocol()
if (request.hasBody()) {
    // do something
}


// throw lỗi build app không có biến env
const Env = use('Env')
Env.getOrFail('APP_SECRET')

// Bạn có thể muốn hiển thị một chế độ xem từ máy chủ và xử lý định tuyến bằng khung giao diện người dùng ưa thích của mình:
Route.any('*', ({ view }) => {
    console.log('tuyến đường  :D')
    view.render('...')
})

//Check lỗi 
const { validateAll } = use('Validator')
const rules = {
    email: 'required|email|unique:users,email',
    password: 'required'
}
const validation = await validateAll({ email: "asd@gmail.com", password: "" }, rules)
if (validation.fails()) {
    return validation.messages()
}

return 'Validation passed'

//log

Logger.info("message.....")
Logger.transport('file').info(new Date().toLocaleString() + " :: " + "message...")

//dowload file

const Helpers = use('Helpers')
Route.get('download/:fileId', async ({ params, response }) => {
    const file = await Files.findorFail(params.fileId)
    response.download(Helpers.tmpPath('uploads/${file.path}'))
})


if (auth.user.id === Number(id)) {
    // chính nó thì reset jwt
    let jwt = await auth.withRefreshToken().generate(auth.user)
    return SucessResponse(response, { jwt, update });
}



const users = await User.query().with('relaPosts').fetch()
const users = await User.query().with('relaPosts', (builder) => {
    builder.where('status', true)
}).fetch()
// get tất cả post trong 1 địa phương
const users = await Countrie.query().with('relaUsers.relaPosts').fetch()
// get model đã đc load
return user.getRelated('relaPosts')
// create post dựa vào user
await user.relaPosts().create({
    title: 'Adonis 101'
})

// thay đổi id liên kết
const countrie = await Countrie.find(1)
const user = await User.find(1)
await user.relaCountrie().associate(countrie)

//drop liên kết
await profile.user().dissociate()