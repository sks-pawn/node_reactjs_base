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

Route.get('/', ({ request, session }) => {
  return { greeting: 'Hello world in JSON' }
}).middleware(['country:convertEmptyData'])
  .formats(['json'], true)

Route.group(() => {
  Route.resource('users', 'Admin/UserController')
    .apiOnly()
    .validator(new Map([
      [['admin/users.store'], ['StoreUser']]
    ]))
}).prefix('admin/')
  .middleware(['country:convertEmptyData'])
  .formats(['json'], true)