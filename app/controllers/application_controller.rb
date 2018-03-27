class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def getUserstat
		return Userstat.find_by(user_id: "99999") # ONLY FOR TEST and @userstat not nil
	end

end
