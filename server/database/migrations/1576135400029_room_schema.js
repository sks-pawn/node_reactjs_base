'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class RoomSchema extends Schema {
  async up () {
    const exists = await this.hasTable('rooms')

    if (!exists)  {
      this.create('rooms', (table) => {
      table.increments()
      table.timestamps()

      table.uuid('uuid').unique()
      })
    }
  }

  down () {
    this.drop('rooms')
  }
}

module.exports = RoomSchema
