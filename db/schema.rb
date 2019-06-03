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

ActiveRecord::Schema.define(version: 2019_06_03_130408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.bigint "host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false
    t.bigint "category1_id"
    t.bigint "category2_id"
    t.index ["category1_id"], name: "index_games_on_category1_id"
    t.index ["category2_id"], name: "index_games_on_category2_id"
    t.index ["host_id"], name: "index_games_on_host_id"
  end

  create_table "invited_users", force: :cascade do |t|
    t.string "nickname"
    t.integer "score"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["game_id"], name: "index_invited_users_on_game_id"
    t.index ["user_id"], name: "index_invited_users_on_user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "finished", default: false
    t.integer "position"
    t.index ["game_id"], name: "index_rounds_on_game_id"
    t.index ["song_id"], name: "index_rounds_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "spotify_link"
    t.string "title"
    t.string "artist"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.bigint "user_id"
    t.index ["category_id"], name: "index_songs_on_category_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "user_guesses", force: :cascade do |t|
    t.bigint "round_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "guesser_id"
    t.bigint "submitter_id"
    t.index ["category_id"], name: "index_user_guesses_on_category_id"
    t.index ["guesser_id"], name: "index_user_guesses_on_guesser_id"
    t.index ["round_id"], name: "index_user_guesses_on_round_id"
    t.index ["submitter_id"], name: "index_user_guesses_on_submitter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "categories", column: "category1_id"
  add_foreign_key "games", "categories", column: "category2_id"
  add_foreign_key "games", "users", column: "host_id"
  add_foreign_key "invited_users", "games"
  add_foreign_key "invited_users", "users"
  add_foreign_key "rounds", "games"
  add_foreign_key "rounds", "songs"
  add_foreign_key "songs", "categories"
  add_foreign_key "songs", "users"
  add_foreign_key "user_guesses", "categories"
  add_foreign_key "user_guesses", "invited_users", column: "guesser_id"
  add_foreign_key "user_guesses", "invited_users", column: "submitter_id"
  add_foreign_key "user_guesses", "rounds"
end
