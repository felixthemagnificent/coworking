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

ActiveRecord::Schema.define(version: 20160615052958) do

  create_table "customers", force: :cascade do |t|
    t.integer  "customer_type"
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.boolean  "is_available"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "meal_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_details", ["meal_id"], name: "index_order_details_on_meal_id"
  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "visit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["visit_id"], name: "index_orders_on_visit_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visit_memberships", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "membership_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "visit_memberships", ["membership_id"], name: "index_visit_memberships_on_membership_id"
  add_index "visit_memberships", ["visit_id"], name: "index_visit_memberships_on_visit_id"

  create_table "visits", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "check_in"
    t.datetime "check_out"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "visits", ["customer_id"], name: "index_visits_on_customer_id"

  create_table "visits_memberships", force: :cascade do |t|
    t.integer "visit_id"
    t.integer "membership_id"
  end

  add_index "visits_memberships", ["membership_id"], name: "index_visits_memberships_on_membership_id"
  add_index "visits_memberships", ["visit_id"], name: "index_visits_memberships_on_visit_id"

end
