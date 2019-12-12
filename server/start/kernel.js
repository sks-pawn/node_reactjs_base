'use strict'

/** @type {import('@adonisjs/framework/src/Server')} */
const Server = use('Server')
const Helpers = use('Helpers')
const fs = require('fs');
/*
|--------------------------------------------------------------------------
| Global Middleware
|--------------------------------------------------------------------------
|
| Global middleware are executed on each http request only when the routes
| match.
|
*/
const globalMiddleware = [
  'Adonis/Middleware/BodyParser',
  // 'Adonis/Middleware/Shield',
  'Adonis/Middleware/Session',
  'App/Middleware/ConvertEmptyStringsToNull',
  'Adonis/Middleware/AuthInit'
]

/*
|--------------------------------------------------------------------------
| Named Middleware
|--------------------------------------------------------------------------
|
| Named middleware is key/value object to conditionally add middleware on
| specific routes or group of routes.
|
| // define
| {
|   auth: 'Adonis/Middleware/Auth'
| }
|
| // use
| Route.get().middleware('auth')
|
*/
let namedMiddleware = {
  auth: 'Adonis/Middleware/Auth',
  guest: 'Adonis/Middleware/AllowGuestOnly'
}

fs.readdirSync(Helpers.appRoot() + '/app/Middleware').forEach(file => {
  let name = file.slice(0, -3);
  let key = file.charAt(0).toLowerCase() + file.slice(1, -3);
  namedMiddleware = {
    ...namedMiddleware, ...{
      [key]: 'App/Middleware' + "/" + name
    }
  }
});

/*
|--------------------------------------------------------------------------
| Server Middleware
|--------------------------------------------------------------------------
|
| Server level middleware are executed even when route for a given URL is
| not registered. Features like `static assets` and `cors` needs better
| control over request lifecycle.
|
*/
const serverMiddleware = [
  'Adonis/Middleware/Static',
  'Adonis/Middleware/Cors'
]

Server
  .registerGlobal(globalMiddleware)
  .registerNamed(namedMiddleware)
  .use(serverMiddleware)
