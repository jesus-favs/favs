class DefaultSubAvatar < ActiveRecord::Migration
  def self.up
    change_column :subscriptions, :avatar_url, :string, :default =>  "/images/hombre1.png" 
  end

  def self.down
  end
end
