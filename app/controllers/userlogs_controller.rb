class UserlogsController < ApplicationController
	# def index 
	# 	@userlogs = Userlog.all
	# end

	# def new
	# 	@userlog = Userlog.new(params[:event_id][:userstat_id])		
	# end

	def create
		@userlog = Userlog.new
		@userstat = Userstat.find(params[:userstat_id])
		@event = Event.find(params[:event_id])
		# insert values from Userstat and Event in Userlog		
		@userlog.userstat_id = @userstat.id
		@userlog.event_id = @event.id
		@userlog.event_number = @event.number
		# event is not asset related
		if @event.asset_number == 0		
			@userlog.available = @userstat.available + @event.amount 
			# @userlog.revenue 
			@userlog.wealth = @userstat.wealth + @event.amount				
			# set status telling system that event has been chosen (async "event choice" vs "player decision")
			@userstat.update(
				eventchosen: true,
				available: @userlog.available,
				# @userlog.revenue,
				wealth: @userlog.wealth
				)
			# update userstat and userlog - CREATE a new userlog with the choosen event_number
			if ! @userstat.save
				redirect_to '/gamestart', :error => "Problem : cannot update record userstat"
			end
		end		
		if ! @userlog.save
			redirect_to '/gamestart', :error => "Problem : cannot create record userlog"
		else
			redirect_to userasset_event_path, :event_id => params[:event_id], :userstat_id => params[:userstat_id]
		end		
	end	
end
