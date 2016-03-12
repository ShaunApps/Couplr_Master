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

ActiveRecord::Schema.define(version: 20160312201356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "email"
    t.boolean  "action"
    t.boolean  "adventure"
    t.boolean  "animation"
    t.boolean  "comedy"
    t.boolean  "documentary"
    t.boolean  "drama"
    t.boolean  "family"
    t.boolean  "horror"
    t.boolean  "musical"
    t.boolean  "mystery"
    t.boolean  "romance"
    t.boolean  "scifi"
    t.boolean  "western"
    t.boolean  "blues"
    t.boolean  "country"
    t.boolean  "disco"
    t.boolean  "electronic"
    t.boolean  "hiphop"
    t.boolean  "jazz"
    t.boolean  "latin"
    t.boolean  "pop"
    t.boolean  "rnb"
    t.boolean  "rap"
    t.boolean  "rock"
    t.boolean  "topforty"
    t.boolean  "african"
    t.boolean  "american"
    t.boolean  "asian"
    t.boolean  "coffee"
    t.boolean  "european"
    t.boolean  "mexican"
    t.boolean  "southamerican"
    t.boolean  "willeatanything"
    t.boolean  "wine"
    t.boolean  "amusementparks"
    t.boolean  "artgalleries"
    t.boolean  "bars"
    t.boolean  "comedyevents"
    t.boolean  "concerts"
    t.boolean  "conventions"
    t.boolean  "dancing"
    t.boolean  "exhibits"
    t.boolean  "festivals"
    t.boolean  "livemusic"
    t.boolean  "lounges"
    t.boolean  "movies"
    t.boolean  "museums"
    t.boolean  "nightclubs"
    t.boolean  "performingarts"
    t.boolean  "theatre"
    t.boolean  "dogs"
    t.boolean  "cats"
    t.boolean  "birds"
    t.boolean  "reptiles"
    t.boolean  "fish"
    t.boolean  "badmitten"
    t.boolean  "baseball"
    t.boolean  "basketball"
    t.boolean  "camping"
    t.boolean  "cycling"
    t.boolean  "fishing"
    t.boolean  "fitness"
    t.boolean  "football"
    t.boolean  "gardening"
    t.boolean  "golf"
    t.boolean  "gym"
    t.boolean  "hiking"
    t.boolean  "hockey"
    t.boolean  "hunting"
    t.boolean  "kayaking"
    t.boolean  "paddleboarding"
    t.boolean  "picnics"
    t.boolean  "running"
    t.boolean  "ski"
    t.boolean  "snowboard"
    t.boolean  "soccer"
    t.boolean  "swimming"
    t.boolean  "tennis"
    t.boolean  "walking"
    t.boolean  "communityservices"
    t.boolean  "earlybirds"
    t.boolean  "environments"
    t.boolean  "geeksandnerds"
    t.boolean  "localpolitics"
    t.boolean  "nightowls"
    t.boolean  "paleo"
    t.boolean  "philanthropy"
    t.boolean  "vegan"
    t.boolean  "vegetarian"
    t.boolean  "volunteer"
    t.boolean  "artist"
    t.boolean  "artsandcrafts"
    t.boolean  "billiards"
    t.boolean  "boardgames"
    t.boolean  "boats"
    t.boolean  "books"
    t.boolean  "cars"
    t.boolean  "cooking"
    t.boolean  "fashion"
    t.boolean  "kidsplaydates"
    t.boolean  "learningandclasses"
    t.boolean  "musician"
    t.boolean  "parenting"
    t.boolean  "photography"
    t.boolean  "politics"
    t.boolean  "traveling"
    t.boolean  "videogames"
    t.boolean  "smoking"
    t.boolean  "children"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country_location"
    t.string   "zip_code"
    t.float    "lat"
    t.float    "lng"
    t.string   "profile_pic"
    t.string   "avatar"
    t.string   "partner_one_name"
    t.string   "partner_two_name"
    t.integer  "ponebmonth"
    t.integer  "ptwobmonth"
    t.integer  "ponebday"
    t.integer  "ptwobday"
    t.integer  "ponebyear"
    t.integer  "ptwobyear"
    t.string   "relationship_status"
    t.string   "we_are_a"
    t.string   "we_are_looking_for"
    t.string   "street_number"
    t.boolean  "have_kids"
    t.text     "about_us"
    t.text     "ideal_friends"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
