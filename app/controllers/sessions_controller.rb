class SessionsController < ApplicationController
	def new
		render "login"
	end

	def create
		user = User.find_by(username: params[:username])
		if user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user_path(user)
		end
		# if user.authenticate
			
		# end
	end


	private

	# def session_params
	# 	params.require(:session)
	# end
end
