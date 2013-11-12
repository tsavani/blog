class PostMaster < ActiveRecord::Base
	belongs_to :blog_master
	has_many :comment

	validates :post_name, :discription, presence:   true
end
