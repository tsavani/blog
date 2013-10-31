class Comment < ActiveRecord::Base
	belongs_to :post_master
	belongs_to :user
end
