# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 42) do

  create_table "avatars", :force => true do |t|
    t.column "name", :string
    t.column "url",  :string
  end

  create_table "bugs", :force => true do |t|
    t.column "level",       :integer
    t.column "status",      :integer,  :default => 0
    t.column "description", :text
    t.column "created_at",  :datetime
    t.column "updated_at",  :datetime
    t.column "feed_id",     :integer
  end

  create_table "cached_feeds", :force => true do |t|
    t.column "href",           :string
    t.column "title",          :string
    t.column "link",           :string
    t.column "feed_data",      :text
    t.column "feed_data_type", :string
    t.column "http_headers",   :text
    t.column "last_retrieved", :datetime
  end

  create_table "feeds", :force => true do |t|
    t.column "href",                    :string
    t.column "title",                   :string
    t.column "link",                    :string
    t.column "latest_post_title",       :text
    t.column "latest_post_link",        :text
    t.column "latest_post_description", :text
    t.column "latest_post_timestamp",   :datetime
    t.column "bogus",                   :integer,  :default => 0
    t.column "charset",                 :string,   :default => "utf-8"
    t.column "bogus_description",       :string
    t.column "avatar_locked",           :integer,  :default => 0
    t.column "created_at",              :datetime
    t.column "updated_at",              :datetime
    t.column "is_bogus",                :integer,  :default => 0
    t.column "is_warning",              :integer,  :default => 0
    t.column "avatar_id",               :integer
    t.column "name",                    :string
    t.column "mail",                    :string
  end

  create_table "feevies", :force => true do |t|
  end

  create_table "pings", :force => true do |t|
    t.column "name",           :text
    t.column "current_offset", :integer,  :default => 0
    t.column "created_at",     :datetime
    t.column "updated_at",     :datetime
    t.column "lock",           :integer,  :default => 0
    t.column "total_count",    :integer,  :default => 0
    t.column "password",       :string
  end

  create_table "posts", :force => true do |t|
    t.column "title",       :string
    t.column "url",         :string
    t.column "description", :text
    t.column "created_at",  :datetime
    t.column "feed_id",     :integer
    t.column "updated_at",  :datetime
  end

  create_table "subscriptions", :force => true do |t|
    t.column "user_id",        :integer
    t.column "feed_id",        :integer
    t.column "avatar_url",     :string,  :default => "/images/hombre1.png"
    t.column "avatar_by_user", :string
    t.column "just_added",     :integer, :default => 1
    t.column "avatar_id",      :integer, :default => 1
  end

  create_table "taggings", :force => true do |t|
    t.column "tag_id",        :integer
    t.column "taggable_id",   :integer
    t.column "taggable_type", :string
    t.column "created_at",    :datetime
  end

  create_table "tags", :force => true do |t|
    t.column "name", :string
  end

  create_table "users", :force => true do |t|
    t.column "login",                       :string,   :limit => 80
    t.column "cryptpassword",               :string,   :limit => 40
    t.column "validkey",                    :string,   :limit => 40
    t.column "email",                       :string,   :limit => 100
    t.column "newemail",                    :string,   :limit => 100
    t.column "ipaddr",                      :string
    t.column "created_at",                  :datetime
    t.column "updated_at",                  :datetime
    t.column "confirmed",                   :integer
    t.column "domains",                     :string
    t.column "image",                       :string
    t.column "firstname",                   :string
    t.column "lastname",                    :string
    t.column "registration_stage",          :integer,                 :default => 0
    t.column "country",                     :string
    t.column "opt_displayed_subscriptions", :string,                  :default => "all"
    t.column "opt_lang",                    :string,                  :default => "en-EN"
    t.column "api_key",                     :string,   :limit => 40
    t.column "opt_display",                 :string,                  :default => "last"
  end

  create_table "votes", :force => true do |t|
    t.column "post_id", :integer
    t.column "mail",    :string
  end

end