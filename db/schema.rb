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

ActiveRecord::Schema[8.0].define(version: 2025_09_06_025505) do
  create_table "applicants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "user_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "status"
    t.string "registration_token"
    t.datetime "token_expires_at"
    t.index ["deleted_at"], name: "index_applicants_on_deleted_at"
  end

  create_table "media", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id"
    t.string "visibility"
    t.string "media_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "approval_status"
    t.integer "approved_by"
    t.datetime "deleted_at"
    t.string "category"
    t.string "s3_key"
    t.string "media_url"
    t.string "tags"
    t.index ["deleted_at"], name: "index_media_on_deleted_at"
  end

  create_table "media_testimonies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "media_url"
    t.integer "user_id"
    t.string "visibility"
    t.string "media_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "user_type_id"
    t.string "alias"
    t.integer "pin"
    t.date "birthday"
    t.string "password_digest"
    t.string "race_ethnicity"
    t.string "phoneNumber"
    t.integer "testimonyID"
    t.integer "testimonyView"
    t.integer "messageID"
    t.integer "resourceView"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "username"
    t.string "provider"
    t.string "phone"
    t.string "gender"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end
end
