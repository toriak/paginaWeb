# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150630214034) do
#TABLA
  create_table "bands", force: true do |t|
    t.string   "name"
    t.date     "creation_date"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
  end
  add_index "bands", ["creator_id"], name: "index_bands_on_creator_id"

#JOIN TABLE
  create_table "bands_musical_styles", force: true do |t|
    t.integer "band_id"
    t.integer "musical_style_id"
  end
  add_index "bands_musical_styles", ["band_id", "musical_style_id"], name: "index_bands_musical_styles_on_band_id_and_musical_style_id"

#TABLA
  create_table "instruments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

#JOIN TABLE
  create_table "instruments_profiles", force: true do |t|
    t.integer "instrument_id"
    t.integer "profile_id"
  end
  add_index "instruments_profiles", ["instrument_id", "profile_id"], name: "index_instruments_profiles_on_instrument_id_and_profile_id"

#TABLA
  create_table "musical_styles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

#JOIN TABLE
  create_table "musical_styles_profiles", force: true do |t|
    t.integer "musical_style_id"
    t.integer "profile_id"
  end
  add_index "musical_styles_profiles", ["musical_style_id", "profile_id"], name: "index_styles_profiles_on_musical_style_id_and_profile_id"

#TABLA
  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "birth_date"
    t.integer  "user_id"
  end
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

#TABLA
  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

#TABLA
  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

#JOIN TABLE
  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end
  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

#TABLA
  create_table "vacancies", force: true do |t|
    t.integer  "band_id"
    t.integer  "instrument_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

#TABLA
  create_table "welcomes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
