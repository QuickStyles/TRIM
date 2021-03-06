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

ActiveRecord::Schema.define(version: 20161011221738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer  "service_id"
    t.integer  "customer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "stripe_txn_id"
    t.index ["customer_id"], name: "index_bookings_on_customer_id", using: :btree
    t.index ["service_id"], name: "index_bookings_on_service_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "website"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "providers", force: :cascade do |t|
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_providers_on_organization_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "body"
    t.integer  "booking_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id", using: :btree
    t.index ["customer_id"], name: "index_reviews_on_customer_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.float    "rate"
    t.boolean  "certified"
    t.string   "location"
    t.float    "duration"
    t.integer  "provider_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["provider_id"], name: "index_services_on_provider_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "gender"
    t.string   "password_digest"
    t.integer  "person_id"
    t.string   "person_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "uid"
    t.string   "provider"
    t.string   "google_raw_info"
    t.string   "stripe_customer_id"
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", using: :btree
  end

  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "services"
  add_foreign_key "providers", "organizations"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "customers"
  add_foreign_key "services", "providers"
end
