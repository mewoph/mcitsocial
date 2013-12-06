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

ActiveRecord::Schema.define(:version => 20131206161233) do

  create_table "comments", :force => true do |t|
    t.integer  "commenter_id"
    t.string   "comment"
    t.integer  "content_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "cached_votes_total", :default => 0
    t.integer  "cached_votes_score", :default => 0
    t.integer  "cached_votes_up",    :default => 0
    t.string   "source"
  end

  add_index "comments", ["cached_votes_score"], :name => "index_comments_on_cached_votes_score"
  add_index "comments", ["cached_votes_total"], :name => "index_comments_on_cached_votes_total"
  add_index "comments", ["cached_votes_up"], :name => "index_comments_on_cached_votes_up"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "feedbacks", :force => true do |t|
    t.integer  "adder_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "company_id"
    t.string   "feedback_content"
    t.boolean  "is_question"
  end

  create_table "protips", :force => true do |t|
    t.integer  "adder_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "category"
    t.integer  "cached_votes_total", :default => 0
    t.integer  "cached_votes_score", :default => 0
    t.integer  "cached_votes_up",    :default => 0
  end

  add_index "protips", ["cached_votes_score"], :name => "index_protips_on_cached_votes_score"
  add_index "protips", ["cached_votes_total"], :name => "index_protips_on_cached_votes_total"
  add_index "protips", ["cached_votes_up"], :name => "index_protips_on_cached_votes_up"

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.integer  "company_id"
    t.integer  "adder_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sub_comments", :force => true do |t|
    t.integer  "commenter_id"
    t.string   "comment"
    t.integer  "content_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "bio",                          :limit => 140
    t.boolean  "is_current_student"
    t.boolean  "is_parttime"
    t.date     "matriculation_date"
    t.date     "graduation_date"
    t.text     "previous_work"
    t.string   "undergrad_major"
    t.string   "undergrad_school"
    t.string   "hometown"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.string   "email",                                       :default => "", :null => false
    t.string   "encrypted_password",                          :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                               :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.string   "areas_of_interest"
    t.string   "languages"
    t.string   "courses"
  end

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], :name => "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], :name => "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
