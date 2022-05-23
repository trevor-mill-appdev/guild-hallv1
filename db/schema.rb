# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_23_180304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "guilds", force: :cascade do |t|
    t.bigint "admin_id"
    t.integer "prop_threshold"
    t.boolean "private"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_guilds_on_admin_id"
  end

  create_table "materials", force: :cascade do |t|
    t.citext "name"
    t.citext "token_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mobs", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.string "serial"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_mobs_on_owner_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.bigint "proposer_id", null: false
    t.bigint "guild_id", null: false
    t.string "status"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guild_id"], name: "index_proposals_on_guild_id"
    t.index ["proposer_id"], name: "index_proposals_on_proposer_id"
  end

  create_table "raiders", force: :cascade do |t|
    t.string "serial"
    t.string "image_url"
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_raiders_on_owner_id"
  end

  create_table "stashes", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.bigint "material_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_stashes_on_material_id"
    t.index ["owner_id"], name: "index_stashes_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.citext "username"
    t.string "image_url"
    t.citext "wallet"
    t.integer "guild_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "voter_id", null: false
    t.bigint "proposal_id", null: false
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposal_id"], name: "index_votes_on_proposal_id"
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "guilds", "users", column: "admin_id"
  add_foreign_key "mobs", "users", column: "owner_id"
  add_foreign_key "proposals", "guilds"
  add_foreign_key "proposals", "users", column: "proposer_id"
  add_foreign_key "raiders", "users", column: "owner_id"
  add_foreign_key "stashes", "materials"
  add_foreign_key "stashes", "users", column: "owner_id"
  add_foreign_key "votes", "proposals"
  add_foreign_key "votes", "users", column: "voter_id"
end
