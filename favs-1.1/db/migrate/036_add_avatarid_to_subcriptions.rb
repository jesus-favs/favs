class AddAvataridToSubcriptions < ActiveRecord::Migration
  def self.up
	add_column :subscriptions, :avatar_id, :integer
	
	@subscriptions = Subscription.find :all
    	@subscriptions.each do |sub|
      	unless sub.avatar_url.nil?
        #tempfile = Tempfile.new('tmp')
        #tempfile.write open("#{RAILS_ROOT}/public" << sub.avatar_url).read
        #tempfile.flush
        
        # Guess file format
        #md = @params[:subscription][:picture].match /\.([^.]+)\z/
        #format = md ? md[1].downcase : nil
        
        #avatar = Avatar.create_from_file tempfile
        #File.delete("#{RAILS_ROOT}/public/#{sub.avatar_url}")
        #sub.update_attribute(:avatar_id, avatar.id) unless avatar.nil?
	sub.update_attribute(:avatar_id, 1)
	#sub.update_attribute(:avatar_url, "/images/hombre1.png")
      	end
    end
  end

  def self.down
	remove_column :subscriptions, :avatar_id, :integer
  end
end
