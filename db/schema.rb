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

ActiveRecord::Schema.define(version: 2019_09_30_101147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "import_responses", force: :cascade do |t|
    t.string "filename"
    t.string "month"
    t.string "catagory"
    t.integer "processedraw"
    t.integer "processed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "responses", force: :cascade do |t|
    t.integer "pseudonym"
    t.string "pstatus"
    t.integer "pcredit_points"
    t.string "penter_date"
    t.string "reg_code"
    t.integer "numinv1"
    t.integer "numcpl1"
    t.integer "numqut1"
    t.integer "numscn1"
    t.integer "numstr1"
    t.integer "numinv2"
    t.integer "numcpl2"
    t.integer "numqut2"
    t.integer "numscn2"
    t.integer "numstr2"
    t.integer "numinv3"
    t.integer "numcpl3"
    t.integer "numqut3"
    t.integer "numscn3"
    t.integer "numstr3"
    t.integer "m_age"
    t.string "m_panel_membership"
    t.string "m_gender_expanded"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "import_id"
  end

end
