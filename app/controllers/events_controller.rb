class EventsController < ApplicationController
	def show 
		@event = Event.find(params[:id])
		# display options
		if @event.amount < 0
			@amounttext = t('.youexpense') + ' '
			@amounttext += @event.amount.to_s
		else
			@amounttext = t('.youearn') + ' '			
			@amounttext += @event.amount.to_s
		end
	end 
end
