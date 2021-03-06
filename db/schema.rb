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

ActiveRecord::Schema.define(version: 2021_08_24_151545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organization_spaces", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "space_id"
    t.index ["organization_id"], name: "index_organization_spaces_on_organization_id"
    t.index ["space_id"], name: "index_organization_spaces_on_space_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "space_id"
    t.integer "numbers"
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["space_id"], name: "index_reservations_on_space_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "capacity"
  end

  create_table "user_organizations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_user_organizations_on_organization_id"
    t.index ["user_id"], name: "index_user_organizations_on_user_id"
  end

  create_table "user_reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "reservation_id"
    t.index ["reservation_id"], name: "index_user_reservations_on_reservation_id"
    t.index ["user_id"], name: "index_user_reservations_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "kana"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "organization_spaces", "organizations"
  add_foreign_key "organization_spaces", "spaces"
  add_foreign_key "reservations", "spaces"
  add_foreign_key "user_organizations", "organizations"
  add_foreign_key "user_organizations", "users"
  add_foreign_key "user_reservations", "reservations"
  add_foreign_key "user_reservations", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
