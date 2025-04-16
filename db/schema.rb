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

ActiveRecord::Schema[7.1].define(version: 2025_04_16_175414) do
  create_table "character_equipments", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "equipment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_equipments_on_character_id"
    t.index ["equipment_id"], name: "index_character_equipments_on_equipment_id"
  end

  create_table "character_skills", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_skills_on_character_id"
    t.index ["skill_id"], name: "index_character_skills_on_skill_id"
  end

  create_table "characters", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "str"
    t.integer "dex"
    t.integer "int"
    t.integer "con"
    t.integer "wis"
    t.integer "chr"
    t.string "name"
    t.integer "ac"
    t.integer "level"
    t.string "race"
    t.string "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "character_equipments", "characters"
  add_foreign_key "character_equipments", "equipment"
  add_foreign_key "character_skills", "characters"
  add_foreign_key "character_skills", "skills"
  add_foreign_key "characters", "users"
end
