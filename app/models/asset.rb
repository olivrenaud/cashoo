class Asset < ApplicationRecord
	# OlivR - relation one to many users / userstats 
	has_many :events, :foreign_key => "asset_number"

	has_many :userassets
	has_many :userstats, through: :userassets
end
