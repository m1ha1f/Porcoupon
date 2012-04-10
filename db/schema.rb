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

ActiveRecord::Schema.define(:version => 20120410193816) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "category", :force => true do |t|
    t.string "name", :limit => 64, :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "store_id"
    t.integer  "rating"
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "coupons", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "image_url"
    t.string   "deal_url"
    t.string   "store_url"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "price"
    t.integer  "views"
    t.integer  "redirects"
    t.integer  "city_id"
    t.integer  "country_id"
    t.integer  "category_id"
    t.integer  "store_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "currency"
  end

  create_table "location", :force => true do |t|
    t.string "name", :limit => 64, :null => false
  end

  create_table "offer", :force => true do |t|
    t.string   "title",      :limit => 200,                                 :null => false
    t.string   "text",       :limit => 2000
    t.string   "imgurl",     :limit => 500
    t.string   "storeurl",   :limit => 500
    t.datetime "startat"
    t.datetime "endat"
    t.decimal  "price",                      :precision => 19, :scale => 2
    t.integer  "categoryid"
    t.integer  "locationid"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tab1", :id => false, :force => true do |t|
    t.integer "a"
    t.integer "b"
  end

  create_table "tmpoferte", :id => false, :force => true do |t|
    t.string "status",              :limit => 10
    t.string "announcementtitle",   :limit => 200
    t.string "soldquantitymessage", :limit => 10
  end

  create_table "tmpstr", :id => false, :force => true do |t|
    t.string "s", :limit => 10
  end

  create_table "trackings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "coupon_id"
    t.boolean  "is_redirected"
    t.datetime "date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "password"
    t.integer  "facebook_id"
    t.binary   "bayes"
    t.integer  "user_type"
  end

end
