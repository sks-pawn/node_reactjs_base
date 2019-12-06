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

Route.group(() => {
  Route.resource('users', 'Admin/UserController')
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
  Route.delete('users', 'Admin/UserController.destroy').middleware(['auth:bodyIsInvalid'])
  Route.delete('destroy-forever', 'Admin/UserController.destroyForever').middleware(['auth:bodyIsInvalid'])
  Route.delete('destroy-forever/:id', 'Admin/UserController.destroyForever')
    .validator('ParamIsExits')
    .middleware('auth')

  Route.post('login', 'Admin/LoginController.normal').middleware('bodyIsInvalid')
  Route.post('upload', 'Admin/UploadController.avatar')
    .validator('UploadImage')
    .middleware('auth')

}).prefix('admin/')
  .middleware(['countryDetector:convertEmptyStringsToNull'])
  .formats(['json'], true)

if (socialAuthen) {
  let listSocial = socialAuthen.split(",")
  Route.group(() => {
    return listSocial.map(element => Route.get(element, 'Admin/LoginController.redirect'));
  }).prefix('login/')
    .middleware('socialAuthenticationForRequest')
  Route.group(() => {
    return listSocial.map(element => Route.get(element, 'Admin/LoginController.callback'));
  }).prefix('authenticated/')
    .middleware('socialAuthenticationForRequest')
}

Route.on('/').render('chat')
