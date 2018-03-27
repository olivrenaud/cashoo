class Event < ApplicationRecord

	# OlivR - relation zero to many Event / assets
	# Event does not "belongs_to :asset"
	belongs_to :userlog
end
