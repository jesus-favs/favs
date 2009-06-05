class AddAvataridToFeeds < ActiveRecord::Migration
  def self.up
	add_column :feeds, :avatar_id, :integer
	@feeds = Feed.find :all
	@feeds.each do |feed| 
      	feed.update_attribute :avatar_id, 1
      	#feed.discover_avatar_txt
    end
	
  end

  def self.down
	remove_column :feeds, :avatar_id, :integer
  end
end
