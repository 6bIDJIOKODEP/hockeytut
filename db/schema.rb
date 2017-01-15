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

ActiveRecord::Schema.define(version: 20170115215154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.integer  "tournament_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "paper_file_name"
    t.string   "paper_content_type"
    t.integer  "paper_file_size"
    t.datetime "paper_updated_at"
    t.index ["tournament_id"], name: "index_documents_on_tournament_id", using: :btree
  end

  create_table "forum_comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "forum_id"
    t.integer  "forum_thread_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["forum_id"], name: "index_forum_comments_on_forum_id", using: :btree
    t.index ["forum_thread_id"], name: "index_forum_comments_on_forum_thread_id", using: :btree
    t.index ["user_id"], name: "index_forum_comments_on_user_id", using: :btree
  end

  create_table "forum_threads", force: :cascade do |t|
    t.string   "subject"
    t.text     "main_discussion_text"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["forum_id"], name: "index_forum_threads_on_forum_id", using: :btree
    t.index ["user_id"], name: "index_forum_threads_on_user_id", using: :btree
  end

  create_table "forums", force: :cascade do |t|
    t.string   "main_branch"
    t.string   "main_branch_short_info"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_forums_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "tournament_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["tournament_id"], name: "index_photos_on_tournament_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_reviews_on_tournament_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.string   "tournament_type"
    t.string   "category"
    t.integer  "teams_qty"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "address"
    t.string   "currency"
    t.integer  "team_price"
    t.integer  "player_price"
    t.text     "description"
    t.boolean  "inhabitancy"
    t.boolean  "food"
    t.boolean  "transfer"
    t.boolean  "entertainment"
    t.boolean  "others"
    t.string   "phone_number"
    t.string   "contact_email"
    t.string   "club"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "category_camp"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "state"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.index ["user_id"], name: "index_tournaments_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                  default: false, null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "phone"
    t.string   "website"
    t.string   "organization"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "documents", "tournaments"
  add_foreign_key "forum_comments", "forum_threads"
  add_foreign_key "forum_comments", "forums"
  add_foreign_key "forum_comments", "users"
  add_foreign_key "forum_threads", "forums"
  add_foreign_key "forum_threads", "users"
  add_foreign_key "forums", "users"
  add_foreign_key "photos", "tournaments"
  add_foreign_key "reviews", "tournaments"
  add_foreign_key "reviews", "users"
  add_foreign_key "tournaments", "users"
end
