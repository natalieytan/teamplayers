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

ActiveRecord::Schema.define(version: 20180508062112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sport_id"
    t.integer "skill"
    t.index ["sport_id"], name: "index_interests_on_sport_id"
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.bigint "sport_id"
    t.bigint "organisation_id"
    t.string "name"
    t.bigint "gender_id"
    t.bigint "skill_id"
    t.bigint "day_id"
    t.string "street_number"
    t.string "route"
    t.string "locality"
    t.string "administrative_area"
    t.string "postal_code"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["day_id"], name: "index_leagues_on_day_id"
    t.index ["gender_id"], name: "index_leagues_on_gender_id"
    t.index ["organisation_id"], name: "index_leagues_on_organisation_id"
    t.index ["skill_id"], name: "index_leagues_on_skill_id"
    t.index ["sport_id"], name: "index_leagues_on_sport_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.string "phone"
    t.string "email"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.integer "gender"
    t.text "image_data"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "postcode"
    t.string "description"
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_players", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.boolean "admin", default: false
    t.text "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_players_on_team_id"
    t.index ["user_id"], name: "index_team_players_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "sport_id"
    t.bigint "skill_id"
    t.bigint "gender_id"
    t.bigint "day_id"
    t.text "description"
    t.string "street_number"
    t.string "route"
    t.string "locality"
    t.string "administrative_area"
    t.string "postal_code"
    t.string "country"
    t.decimal "latitude"
    t.decimal "longitude"
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["day_id"], name: "index_teams_on_day_id"
    t.index ["gender_id"], name: "index_teams_on_gender_id"
    t.index ["owner_id"], name: "index_teams_on_owner_id"
    t.index ["skill_id"], name: "index_teams_on_skill_id"
    t.index ["sport_id"], name: "index_teams_on_sport_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "interests", "sports"
  add_foreign_key "interests", "users"
  add_foreign_key "leagues", "days"
  add_foreign_key "leagues", "genders"
  add_foreign_key "leagues", "organisations"
  add_foreign_key "leagues", "skills"
  add_foreign_key "leagues", "sports"
  add_foreign_key "profiles", "users"
  add_foreign_key "team_players", "teams"
  add_foreign_key "team_players", "users"
  add_foreign_key "teams", "days"
  add_foreign_key "teams", "genders"
  add_foreign_key "teams", "skills"
  add_foreign_key "teams", "sports"
  add_foreign_key "teams", "users", column: "owner_id"
end
