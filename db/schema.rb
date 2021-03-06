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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130403175028) do

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "priority"
  end

  create_table "memberships", :force => true do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.string  "email"
    t.string  "name"
    t.string  "phone"
  end

  create_table "notifications", :force => true do |t|
    t.integer  "priority"
    t.text     "todo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "user_email"
    t.string   "user_phone"
  end

  create_table "profiles", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.text    "about"
    t.string  "phone"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "subtasks", :force => true do |t|
    t.string   "title"
    t.integer  "priority"
    t.datetime "created_at", :null => false
    t.integer  "task_id"
    t.datetime "updated_at", :null => false
    t.integer  "group_id"
  end

  add_index "subtasks", ["group_id"], :name => "index_subtasks_on_group_id"
  add_index "subtasks", ["task_id"], :name => "index_subtasks_on_task_id"

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.integer  "priority"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "group_id"
  end

  add_index "tasks", ["group_id"], :name => "index_tasks_on_group_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "phone"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
