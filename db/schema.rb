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

ActiveRecord::Schema.define(version: 20130907003638) do

  create_table "albums", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["created_at"], name: "index_articles_on_created_at", using: :btree

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogs", ["created_at"], name: "index_blogs_on_created_at", using: :btree

  create_table "discoveries", force: true do |t|
    t.string   "title"
    t.string   "person"
    t.text     "content"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "department"
    t.string   "email"
    t.string   "name"
    t.string   "subject"
    t.text     "body"
    t.boolean  "read",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["email", "name"], name: "index_messages_on_email_and_name", using: :btree
  add_index "messages", ["email"], name: "index_messages_on_email", using: :btree
  add_index "messages", ["name"], name: "index_messages_on_name", using: :btree

  create_table "photos", force: true do |t|
    t.integer  "album_id"
    t.string   "title"
    t.string   "description"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id", using: :btree

  create_table "shows", force: true do |t|
    t.datetime "date"
    t.string   "venue"
    t.string   "address"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shows", ["address"], name: "index_shows_on_address", using: :btree
  add_index "shows", ["created_at"], name: "index_shows_on_created_at", using: :btree
  add_index "shows", ["date", "venue"], name: "index_shows_on_date_and_venue", using: :btree
  add_index "shows", ["date"], name: "index_shows_on_date", using: :btree
  add_index "shows", ["venue", "address"], name: "index_shows_on_venue_and_address", using: :btree
  add_index "shows", ["venue"], name: "index_shows_on_venue", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "blog_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["blog_id", "tag_id"], name: "index_taggings_on_blog_id_and_tag_id", using: :btree
  add_index "taggings", ["blog_id"], name: "index_taggings_on_blog_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
