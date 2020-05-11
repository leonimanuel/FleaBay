class UsersController < ApplicationController
	include UsersHelper
	before_action :current_user

	def new
		@user = User.new
	end

	def create
		user = User.create(user_params)
		session[:user_id] = user.id

		redirect_to user_path(user)
	end

	def show
		if params[:id].to_i != current_user.id 
			# raise "WHHHH"
			redirect_to user_path(current_user)
		end
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
		purchased_items(@user)
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
