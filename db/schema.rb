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

ActiveRecord::Schema.define(version: 20140628033613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.integer  "tab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.integer  "caf_number"
    t.integer  "len"
    t.integer  "old_caf_number"
    t.integer  "parent_Account_number"
    t.integer  "account_number"
    t.integer  "mdn"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "fh_name"
    t.string   "nationality"
    t.string   "gender"
    t.date     "dob"
    t.string   "customer_type"
    t.string   "cust_category"
    t.string   "entity_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "landmark"
    t.string   "city"
    t.string   "state"
    t.string   "pincode"
    t.string   "local_address_1"
    t.string   "local_address_2"
    t.string   "local_city"
    t.string   "local_state"
    t.integer  "local_pin"
    t.string   "email"
    t.string   "contact_number"
    t.string   "poi_type"
    t.string   "poa_type"
    t.date     "caf_entry_date"
    t.integer  "ageing"
    t.integer  "ageing_act"
    t.string   "rsn"
    t.date     "activation_date"
    t.string   "av_status"
    t.string   "cv_status"
    t.string   "caf_status"
    t.string   "scrutiny_status"
    t.string   "av_user_id"
    t.string   "cv_user_id"
    t.string   "otc_code"
    t.string   "circle"
    t.string   "caf_ciou"
    t.string   "ciou"
    t.string   "dnc"
    t.string   "telemarketing"
    t.string   "mobile"
    t.string   "av_agency"
    t.date     "av_done_date"
    t.string   "caf_updated_date"
    t.string   "scrutiny_updated_by"
    t.string   "reorder"
    t.string   "operator_name"
    t.integer  "operator_credit_limit"
    t.integer  "tariff_plan"
    t.string   "old_account_number"
    t.integer  "credit_limit"
    t.integer  "credit_score"
    t.string   "pos_code"
    t.string   "product_type"
    t.string   "mnp_flag"
    t.string   "service_type"
    t.integer  "pevious_cv_limit"
    t.integer  "re_av_count"
    t.date     "re_av_date"
    t.string   "av_neg_remarks"
    t.string   "re_av_reasons"
    t.string   "caf_remark"
    t.string   "av_neg_sub_reasons"
    t.date     "cv_done_date"
    t.string   "security_amount"
    t.string   "tariff_plan_value"
    t.string   "product_type_value"
    t.string   "corp_company_name"
    t.string   "wh_status"
    t.string   "omnidocs_status"
    t.string   "tmid"
    t.date     "pg_tvp_date"
    t.string   "tvp_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "tabs", force: true do |t|
    t.string   "name"
    t.string   "tab_code"
    t.string   "pincode"
    t.string   "mac_address"
    t.string   "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "employee_uid"
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "role_name"
    t.integer  "tab_id"
    t.string   "username"
    t.datetime "logout_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
