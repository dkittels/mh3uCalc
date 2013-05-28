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

ActiveRecord::Schema.define(:version => 20130527194621) do

  create_table "armor_sets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "armor_skills", :force => true do |t|
    t.integer  "equipment_id"
    t.integer  "skill_id"
    t.integer  "value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "armor_skills", ["equipment_id"], :name => "index_armor_skills_on_equipment_id"
  add_index "armor_skills", ["skill_id"], :name => "index_armor_skills_on_skill_id"

  create_table "builds", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "generated_description"
    t.integer  "position_0_id"
    t.integer  "position_1_id"
    t.integer  "position_2_id"
    t.integer  "position_3_id"
    t.integer  "position_4_id"
    t.integer  "position_5_id"
    t.integer  "talisman_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "builds", ["position_0_id"], :name => "index_builds_on_position_0_id"
  add_index "builds", ["position_1_id"], :name => "index_builds_on_position_1_id"
  add_index "builds", ["position_2_id"], :name => "index_builds_on_position_2_id"
  add_index "builds", ["position_3_id"], :name => "index_builds_on_position_3_id"
  add_index "builds", ["position_4_id"], :name => "index_builds_on_position_4_id"
  add_index "builds", ["position_5_id"], :name => "index_builds_on_position_5_id"
  add_index "builds", ["talisman_id"], :name => "index_builds_on_talisman_id"

  create_table "equipment", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "slots"
    t.integer  "armor_set_id"
    t.integer  "fire_res"
    t.integer  "water_res"
    t.integer  "thunder_res"
    t.integer  "ice_res"
    t.integer  "dragon_res"
    t.integer  "max_defense"
    t.boolean  "in_game"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "rarity"
    t.boolean  "blademaster"
    t.boolean  "gunner"
    t.integer  "price"
  end

  add_index "equipment", ["armor_set_id"], :name => "index_equipment_on_armor_set_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sub_skills", :force => true do |t|
    t.string   "name"
    t.integer  "skill_id"
    t.integer  "parent_sub_skill_id"
    t.integer  "skill_value"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "sub_skills", ["skill_id"], :name => "index_sub_skills_on_skill_id"

end
