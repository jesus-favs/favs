class AddMailToFeeds < ActiveRecord::Migration
  def self.up

      add_column :feeds, :mail, :string	

      @feeds = Feed.find :all
      @feeds.each do |feed| 
      feed.update_attribute :name, "pupil"
      feed.update_attribute :mail, "pupil@pupil.com"
      end
  end

  def self.down
  end
end
