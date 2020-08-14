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

ActiveRecord::Schema.define(version: 2020_08_13_140935) do

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.text "introduction", null: false
    t.integer "price", null: false
    t.integer "category", null: false
    t.integer "item_condition", null: false
    t.integer "pastage_payer", null: false
    t.integer "preparation_day", null: false
    t.integer "pastage_type", null: false
    t.string "image", null: false
    t.integer "prefecture_code", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

end
