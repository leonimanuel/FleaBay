class SessionsController < ApplicationController
	def login
		render "login"
	end

	def create
		user = User.find_by(email: params[:email])
		if user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user_path(user)
		end
	end

	def delete
		session.delete :user_id
		redirect_to "/"
	end
end

