class UsersController < ApplicationController
	def show
		@user = User.find(session[:user_id])
	end

	def purchases
		@items = Item.bought(session)
	end
end
