# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_14_203448) do

  create_table "changes", force: :cascade do |t|
    t.integer "row_entry_id", null: false
    t.string "old_value"
    t.string "new_value"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["row_entry_id"], name: "index_changes_on_row_entry_id"
    t.index ["user_id"], name: "index_changes_on_user_id"
  end

  create_table "executed_ats", force: :cascade do |t|
    t.integer "row_entry_id", null: false
    t.string "old_value"
    t.string "new_value"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["row_entry_id"], name: "index_executed_ats_on_row_entry_id"
    t.index ["user_id"], name: "index_executed_ats_on_user_id"
  end

  create_table "microservices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
  end

  create_table "row_entries", force: :cascade do |t|
    t.string "Table_Name"
    t.integer "microservice_id"
    t.integer "record_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transaction_entries", force: :cascade do |t|
    t.integer "User_id"
    t.integer "Change_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Change_id"], name: "index_transaction_entries_on_Change_id"
    t.index ["User_id"], name: "index_transaction_entries_on_User_id"
  end

  create_table "trasactions", force: :cascade do |t|
    t.integer "User_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["User_id"], name: "index_trasactions_on_User_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "developer", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "changes", "row_entries"
  add_foreign_key "changes", "users"
  add_foreign_key "executed_ats", "row_entries"
  add_foreign_key "executed_ats", "users"
  add_foreign_key "transaction_entries", "Changes"
  add_foreign_key "trasactions", "Users"
end
