class SessionsController < ApplicationController
	def login
		render "login"
	end

	def signup
		render "signup"
	end

	def create
		# binding.pry
		if auth
			# raise "w that fb eh"
			user = User.find_or_create_by(email: auth["info"]["email"]) do |u|
				u.name = auth["info"]["name"]
	      # u.email = auth['info']['email']
	      # u.image = auth['info']['image']
      	u.password_digest = SecureRandom.hex
    	end
			session[:user_id] = user.id
			redirect_to "/"
  	
  	elsif user = User.find_by(email: params[:email])
			# raise "TRYing to log in huh bud?"
			if user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to user_path(user)
			end
		else
			user = User.create(session_params)
			session[:user_id] = user.id
			redirect_to user_path(user)
		end
	end

	def delete
		session.delete :user_id
		redirect_to "/"
	end



	private
	
	def auth
		request.env["omniauth.auth"]	
	end

	def session_params
		params.permit(:name, :email, :password)
	end
end

