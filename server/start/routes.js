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
Route.get('/', ({ }) => {
  return { greeting: 'Hello world in JSON' }
}).formats(['json'], true)

// Route.resource('users', () => { return { greeting: 'Hello world in JSON' } })
//   // .only(['index', 'show'])
//   // .middleware(new Map([
//   //   [['store', 'update', 'destroy'], ['auth']]]))
//   .formats(['json'], true)