class Userlog < ApplicationRecord

	belongs_to :userstat
	has_many :events
end
