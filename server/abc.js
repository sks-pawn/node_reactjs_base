// get Config 
const Config = use('Config').get('app.http.trustProxy')
console.log('appSecret :', appSecret);


// throw lỗi build app không có biến env
const Env = use('Env')
Env.getOrFail('APP_SECRET')

// Bạn có thể muốn hiển thị một chế độ xem từ máy chủ và xử lý định tuyến bằng khung giao diện người dùng ưa thích của mình:
Route.any('*', ({ view }) => {
    console.log('tuyến đường  :D')
    view.render('...')
})