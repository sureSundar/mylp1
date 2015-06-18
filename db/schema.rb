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

ActiveRecord::Schema.define(version: 20150618120525) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",         default: 0, null: false
    t.integer  "attempts",         default: 0, null: false
    t.text     "handler",                      null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "progress_stage"
    t.integer  "progress_current", default: 0
    t.integer  "progress_max",     default: 0
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "hpusers", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "client_id"
    t.string   "client_secret"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.string   "original"
    t.string   "final"
    t.integer  "height"
    t.integer  "width"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["project_id"], name: "index_images_on_project_id"

  create_table "payoffs", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "payoff"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payoffs", ["project_id"], name: "index_payoffs_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "user"
    t.string   "logo"
    t.integer  "hpuser_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "projects", ["hpuser_id"], name: "index_projects_on_hpuser_id"

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.integer  "top_left_x"
    t.integer  "top_left_y"
    t.integer  "width"
    t.integer  "height"
    t.string   "original"
    t.string   "watermark"
    t.integer  "watermark_strength"
    t.integer  "watermark_resolution"
    t.string   "link"
    t.integer  "image_id"
    t.integer  "payoff_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "trigger"
  end

  add_index "regions", ["image_id"], name: "index_regions_on_image_id"
  add_index "regions", ["payoff_id"], name: "index_regions_on_payoff_id"

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
    t.string   "client_id"
    t.string   "client_secret"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
