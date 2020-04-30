class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.create(user_params)
		session[:user_id] = user.id

		redirect_to user_path(user)
	end

	def show
		@user = User.find(session[:user_id])
	end

	def edit
		@user = User.find(session[:user_id])
	end

	def update
		user = User.update(user_params)

		redirect_to user_path(user)
	end

	def purchases
		@items = Item.bought(session)
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
