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

ActiveRecord::Schema.define(version: 20150129184227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "text_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "old_no"
    t.integer  "new_no"
  end

  add_index "comments", ["old_no", "new_no"], name: "index_comments_on_old_no_and_new_no", unique: true, using: :btree
  add_index "comments", ["text_file_id"], name: "index_comments_on_text_file_id", using: :btree

  create_table "reviews", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revisions", force: true do |t|
    t.integer  "number"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_files", force: true do |t|
    t.string   "name"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "text_files", ["review_id"], name: "index_text_files_on_review_id", using: :btree

end
