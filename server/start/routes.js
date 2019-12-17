'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URLs and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')
const Env = use('Env')
const socialAuthen = Env.get('SOCIAL_AUTHENTICATION')

Route.get('/', ({ response }) => response.sucessResponseFn({ data: 'Hello world' }))
  .middleware(['countryDetector:convertEmptyStringsToNull'])

if (socialAuthen) {
  let listSocial = socialAuthen.split(",")
  Route.group(() => {
    return listSocial.map(element => Route.get(element, 'LoginController.redirect'));
  }).prefix('login/')
    .middleware('socialAuthenticationForRequest')
  Route.group(() => {
    return listSocial.map(element => Route.get(element, 'LoginController.callback'));
  }).prefix('authenticated/')
    .middleware('socialAuthenticationForRequest')
}

Route.group(() => {
  Route.resource('users', 'UserController')
    .apiOnly()
    .validator(new Map([
      [['store'], ['UserStoreUpdate']],
      [['show'], ['ParamIsExits']],
      [['update'], ['ParamIsExits']],
      [['update'], ['UserStoreUpdate']],
      [['destroy'], ['ParamIsExits']]
    ]))
    .middleware(new Map([
      [['index', 'show', 'update', 'destroy'], ['auth']],
      [['store', 'update'], ['bodyIsInvalid']]
    ]))
  Route.delete('users', 'UserController.destroy').middleware(['auth:bodyIsInvalid'])
  Route.delete('destroy-forever', 'UserController.destroyForever').middleware(['auth:bodyIsInvalid'])
  Route.delete('destroy-forever/:id', 'UserController.destroyForever')
    .validator('ParamIsExits')
    .middleware('auth')

  Route.post('login', 'LoginController.normal').middleware('bodyIsInvalid')
  Route.post('upload', 'UploadController.avatar')
    .validator('UploadImage')
    .middleware('auth')

}).prefix('admin/')
  .middleware(['countryDetector:convertEmptyStringsToNull'])
  .formats(['json'], true)


Route.group(() => {
  Route.get(':id', 'RoomController.select')
  Route.post('', 'RoomController.create')
  Route.post(':id', 'RoomController.createMessage')
}).prefix('/rooms')
  .middleware(['countryDetector:convertEmptyStringsToNull'])
  .formats(['json'], true)




const Ws = use('Ws')
Route.get('/test', () => {
  Ws.getChannel('subscriptions')
  const { broadcast } = Ws.getChannel('chat:*').topic('chat:alb')
})
