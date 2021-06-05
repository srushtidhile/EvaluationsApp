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

ActiveRecord::Schema.define(version: 2020_12_03_225211) do

  create_table "feedbacks", force: :cascade do |t|
    t.string "comment"
    t.string "grade"
    t.integer "student_id", null: false
    t.integer "presentation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["presentation_id"], name: "index_feedbacks_on_presentation_id"
    t.index ["student_id"], name: "index_feedbacks_on_student_id"
  end

  create_table "presentations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "presentations_students", id: false, force: :cascade do |t|
    t.integer "presentation_id"
    t.integer "student_id"
    t.index ["presentation_id"], name: "index_presentations_students_on_presentation_id"
    t.index ["student_id"], name: "index_presentations_students_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "feedbacks", "presentations"
  add_foreign_key "feedbacks", "students"
end
