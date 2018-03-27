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

ActiveRecord::Schema.define() do

  create_table "assets", force: :cascade do |t|
    t.integer "number", default: 0, null: false
    t.string "name"
    t.text "extra"
    t.string "category"
    t.string "subcategory"
    t.decimal "value", precision: 15, default: "0"
    t.decimal "profitrate", precision: 15, default: "0"
    t.decimal "creditrate", precision: 15, default: "0"
    t.decimal "feerate", precision: 15, default: "0"
    t.decimal "taxrate", precision: 15, default: "0"
    t.decimal "TaxOnSellProfitRate", precision: 15, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_assets_on_number"
  end

  create_table "events", force: :cascade do |t|
    t.integer "number", default: 0, null: false
    t.string "title"
    t.string "color"
    t.integer "asset_number", default: 0, null: false
    t.decimal "amount", precision: 15, default: "0"
    t.decimal "ratio", precision: 15, default: "0"
    t.string "assetmove"
    t.text "message"
    t.text "edu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_number"], name: "index_events_on_asset_number"
    t.index ["number"], name: "index_events_on_number"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.decimal "monthsalary", precision: 15, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_jobs_on_title"
  end

  create_table "userassets", force: :cascade do |t|
    t.integer "userstat_id", default: 0, null: false
    t.integer "asset_id", default: 0, null: false
    t.integer "asset_number", default: 0, null: false
    t.decimal "value", precision: 15, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id", "userstat_id"], name: "index_userassets_on_asset_id_and_userstat_id", unique: true
    t.index ["asset_id"], name: "index_userassets_on_asset_id"
    t.index ["asset_number"], name: "index_userassets_on_asset_number"
    t.index ["userstat_id", "asset_id"], name: "index_userassets_on_userstat_id_and_asset_id", unique: true
    t.index ["userstat_id"], name: "index_userassets_on_userstat_id"
  end

  create_table "userlogs", force: :cascade do |t|
    t.integer "userstat_id", default: 0, null: false
    t.integer "event_id", default: 0, null: false
    t.integer "event_number", default: 0, null: false
    t.decimal "available", precision: 15, default: "0"
    t.decimal "revenue", precision: 15, default: "0"
    t.decimal "wealth", precision: 15, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false    
    t.index ["event_id"], name: "index_userlogs_on_event_id"
    t.index ["event_number"], name: "index_userlogs_on_event_number"
    t.index ["userstat_id"], name: "index_userlogs_on_userstat_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "userstats", force: :cascade do |t|
    t.decimal "available", precision: 15, default: "0"
    t.decimal "revenue", precision: 15, default: "0"
    t.decimal "wealth", precision: 15, default: "0"
    t.integer "user_id", default: 0, null: false
    t.integer "job_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "eventchosen", default: false, null: false
    t.index ["user_id"], name: "index_userstats_on_user_id"
  end

end
