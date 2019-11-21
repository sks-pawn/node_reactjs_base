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
const User = use('App/Models/User')

Route.get('/', async () => {
  return "12345"
})

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
      [['index', 'show', 'update', 'destroy'], ['auth']]
    ]))

  Route.delete('users', 'Admin/UserController.destroy').middleware('auth')
  Route.delete('destroy-forever', 'Admin/UserController.destroyForever').middleware('auth')
  Route.delete('destroy-forever/:id', 'Admin/UserController.destroyForever')
    .validator('ParamIsExits')
    .middleware('auth')

  Route.post('upload', 'Admin/UploadController.avatar')
    .validator('UploadImage')
    .middleware('auth')

  Route.get('locale', 'Admin/LocaleController.getLocale')
}).prefix('admin/')
  .middleware(['country:convertEmptyData'])
  .formats(['json'], true)

Route.group(() => {
  Route.post('normal', 'Admin/LoginController.normal')
  Route.get('facebook', 'Admin/LoginController.redirect')
}).prefix('login/')
  .middleware(['country:convertEmptyData'])
  .formats(['json'], true)

Route.get('authenticated/facebook', 'Admin/LoginController.callback')