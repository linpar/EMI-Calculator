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

ActiveRecord::Schema.define(version: 20140509045028) do

  create_table "emis", force: true do |t|
    t.integer  "uid"
    t.float    "emi"
    t.float    "principal_amount"
    t.float    "interest_rate"
    t.float    "payments_year"
    t.float    "number_installments"
    t.float    "residual_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "principals", force: true do |t|
    t.integer  "uid"
    t.float    "in"
    t.float    "pn"
    t.float    "opn1"
    t.float    "installment"
    t.float    "principal1"
    t.float    "interest2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
