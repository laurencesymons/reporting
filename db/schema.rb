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

ActiveRecord::Schema.define(version: 2019_09_27_093838) do

  create_table "daily_figures", force: :cascade do |t|
    t.integer "R01_Completers"
    t.integer "R02_Starters"
    t.integer "Recruited"
    t.integer "R01_Completes_To_R02_Starters_Ratio"
    t.integer "R02_Starters_To_Recruited_Ratio"
    t.integer "R01_Completers_To_Recruited_Ratio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "import_id"
    t.integer "quarter"
    t.string "timestamp"
  end

  create_table "imports", force: :cascade do |t|
    t.string "filename"
    t.string "month"
    t.string "catagory"
    t.integer "processedraw"
    t.integer "processed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "raw_recruitments", force: :cascade do |t|
    t.integer "import_id"
    t.string "dispcode"
    t.string "u_email"
    t.string "pstatu_date"
    t.string "penter"
    t.integer "day"
    t.string "reg_code"
    t.string "m_recruit"
    t.string "m_signup"
    t.string "m_panel_membership"
    t.string "m_gender_expanded"
    t.string "m_age_bands_report"
    t.string "datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
