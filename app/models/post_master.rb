class PostMaster < ActiveRecord::Base
	belongs_to :blog_master
	has_many :comment
end
