class UserassetsController < ApplicationController

	def new
		@userasset = Userasset.new
		
		redirect_to '/gamestart', :notice => "Implementing USER ASSET in progress ..."
		# change OK button by accept / refuse


		# if eventchosen is an opportunity which is accepted
			# if verifyCredit then updateLiabilities
			# updateAssets - create a new userassets with asset_number
		# updateBank for OP, green or red
		# set eventchosen to false		

	end
end
