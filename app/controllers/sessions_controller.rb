class SessionsController < ApplicationController
	def login
		render "login"
	end

	def create
		if auth
			user = User.find_or_create_by(email: auth["info"]["email"]) do |u|
				u.name = auth["info"]["name"]
	      # u.email = auth['info']['email']
	      # u.image = auth['info']['image']
      	u.password_digest = SecureRandom.urlsafe_base64
    	end

			session[:user_id] = user.id
			binding.pry
			redirect_to "/"
  	else
			user = User.find_or_create_by(email: params[:email])
			if user.authenticate(params[:password])
				session[:user_id] = user.id
				binding.pry
				redirect_to user_path(user)
			end
		end




	end

	def auth
		request.env["omniauth.auth"]	
	end

	def delete
		session.delete :user_id
		redirect_to "/"
	end
end

