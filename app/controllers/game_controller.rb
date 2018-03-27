class GameController < ApplicationController

	def getnextevent
		# user first turn
		if ! Userlog.exists?		
			@event = Event.first
			return @event
		end			
		@userlog = Userlog.where(userstat_id: @userstat.id).last		
		@event_number = @userlog.event_number
		# user is in tutorial level (event number below 100) 
		if @event_number < 100
			@event = Event.find_by(number: @event_number)
			@event = Event.where("id > ?", @event.id).first 	# event is next one / chosen sequencially
			return @event	 			
		end
		# user is in level 1 (between 100 and 149)
		if @event_number >= 149
			begin	
				@event_number = rand(100..149) # randomize the event choice above number 99
				@event = Event.find_by(number: @event_number)
			end while ! @event
			return @event 
		end			
		# default nil event just in case
		return nil
	end

	def wheel		
		# initialiser (init) userstats and "first" userassets		
		initUserstats

		# if @userstat.job_id #change this by checking userstat eventchosen
		# 	flash.now[:notice] = "Not the first wheel turns"			
		# else
		# 	flash.now[:notice] = "First wheel turns"			
		# end
		@lastuserlog = Userlog.where(userstat_id: @userstat.id).last
		if ! @userstat.eventchosen
			if ! @lastuserlog
				@event = Event.first
			else
				# choose next event - unless the choosen event asset already exists in userassets 
				begin 
					@event = getnextevent
				end while Userasset.find_by(asset_number: @event.asset_number, userstat_id: @userstat.id)
			end				
		else			
			if ! @lastuserlog
				redirect_to '/gamestart', :error => "Problem : last user log does not exist"
			end
			@event = Event.find(@lastuserlog.event_id)			
		end
		# show event to screen - eventchosen			
		if ! @event
			redirect_to '/gamestart', :error => "Problem : eventchoosen is true and/or event does not exist"
		else
			redirect_to event_path(@event.id, @userstat.id)
		end
		# CREATE a new userlog with the choosen event_number			
		# redirect_to 'userlogs' # Userlogs.create(@userstat, @event)
		# return			
		
		# if eventchosen is an opportunity which is accepted
			# if verifyCredit then updateLiabilities
			# updateAssets - create a new userassets with asset_number
		# updateBank for OP, green or red
		# set eventchosen to false	
	end

	# start game
	def start
		# @userstat = Userstat.find_by(user_id: "testuser")
		initUserstats
	end

	def create
		# @user = User.find_by_email(params[:email])
	    # if @user && @user.authenticate(params[:password])          
	    #   session[:user_id] = @user.id # OlivR - session is also checking password !!!
	    # end # or call below function: checkUser        
	    # OlivR - Check if user stat are correctly initialized before lauching game	    
	    initUserstats
	   	if @userstat
			redirect_to "/gamestart"
		else
			redirect_to root_path
		end	
	end
	# def checkUser
	# 	@user = User.new(user_params) 
	# 	if @user.save 
	# 	  session[:user_id] = @user.id 
	# 	  redirect_to '/' 
	# 	else 
	# 	  redirect_to '/signup' 
	# 	end
	# end
	# private
	# 	def user_params 
	#   #params.require(:user).permit(:email)
	# 	params.require(:user).permit(:email, :password) 
	# end

	def french
		# change language to French
		flash.now[:notice] = "App language is French."
		redirect_to "/gamestart"
	end

	def english
		# change language to English
		flash.now[:notice] = "App language is English."
		redirect_to "/gamestart"
	end

	# OlivR "real" vs "test" user has to be changed in game controller and user model
	# test user uses user_id "99999"
	def initUserstats
		@userstat = getUserstat
		# @userstat = Userstat.find_by(user_id: "99999") # ONLY FOR TEST and @userstat not nil
		if ! @userstat
			flash.now[:error] = "Userstats Record missing - User's statistics cannot be queried."
		else					
			# populate user assets with a bank account - asset number "1"
			if ! Userasset.find_by(userstat_id: @userstat.id)		
				@asset = Asset.find_by(number: "1")
				if ! @asset
					flash.now[:error] = "userassets Record missing - User's assets cannot be queried."
				else
					# OlivR TODO - should I put these IF tests and record creation in usersasset model instead of game controller ???
					@userasset = @userstat.userassets.create(
						:userstat_id => @userstat.id,
						:asset_id => @asset.id, 
						:asset_number => @asset.number,
						:value => 80
						)
					if ! @userasset.save
						flash.now[:error] = "userassets Record cannot be saved User's assets."
					else
						flash.now[:error] = "user's stats and assets are populated."						
					end
				end
			end
		end
	end

end
