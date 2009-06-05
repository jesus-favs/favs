class AddOptDisplay < ActiveRecord::Migration
  def self.up
    add_column :users, :opt_display, :string, :default => "last"

    @users = User.find :all
    @users.each do |user| 
      user.update_attribute :opt_display, "last"
    end
  end

  def self.down
    remove_column :users, :opt_lang
  end
end
