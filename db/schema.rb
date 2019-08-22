# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_22_010824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aeroportos", force: :cascade do |t|
    t.string "nome"
    t.string "codigo"
    t.string "apelido"
    t.bigint "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_aeroportos_on_cidade_id"
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.bigint "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.integer "number"
    t.integer "origin_id"
    t.integer "destination_id"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.integer "national_id"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "passenger_id"
    t.bigint "flight_id"
    t.integer "seat_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_tickets_on_flight_id"
    t.index ["passenger_id"], name: "index_tickets_on_passenger_id"
  end

  add_foreign_key "aeroportos", "cidades"
  add_foreign_key "cidades", "estados"
  add_foreign_key "tickets", "flights"
  add_foreign_key "tickets", "passengers"
end
