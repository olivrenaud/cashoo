class Userstat < ApplicationRecord

	# OlivR - relation one to many users / userstats 
#	 belongs_to :user
 	has_many :userassets
	has_many :assets, through: :userassets

	has_many :userlogs
end
