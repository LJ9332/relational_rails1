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

ActiveRecord::Schema[7.1].define(version: 2024_03_19_023553) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "f1_drivers", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.boolean "world_champion"
    t.bigint "f1_team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["f1_team_id"], name: "index_f1_drivers_on_f1_team_id"
  end

  create_table "f1_teams", force: :cascade do |t|
    t.string "name"
    t.integer "horsepower"
    t.boolean "slick_tires"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "f1_drivers", "f1_teams"
end
