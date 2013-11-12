class BlogMaster < ActiveRecord::Base
	belongs_to :user
	has_many :post_master

validates :blog_name,:discription, presence:   true
end
