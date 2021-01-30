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

ActiveRecord::Schema.define(version: 2021_01_30_191137) do

  create_table "identities", force: :cascade do |t|
    t.text "username", null: false
    t.text "name", null: false
    t.text "avatar_url"
    t.text "public_key", null: false
    t.string "server_ip", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_identities_on_name"
    t.index ["public_key"], name: "index_identities_on_public_key"
    t.index ["username"], name: "index_identities_on_username"
  end

end
