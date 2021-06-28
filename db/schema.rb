# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_628_143_558) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'cards', force: :cascade do |t|
    t.integer 'card_id'
    t.integer 'color'
    t.integer 'shape'
    t.integer 'filling'
    t.integer 'number'
    t.string 'bit_id'
    t.string 'card_name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'games', force: :cascade do |t|
    t.uuid 'game_id'
    t.integer 'num_of_players'
    t.datetime 'start_time'
    t.datetime 'end_time'
    t.integer 'deck', array: true
    t.integer 'deck_offset'
    t.integer 'current_cards'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
