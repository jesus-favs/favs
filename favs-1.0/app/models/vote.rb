class Vote < ActiveRecord::Base
	belongs_to :story
	
	validates_presence_of :post_id, :mail
end
