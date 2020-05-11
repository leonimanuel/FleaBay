class SessionsController < ApplicationController
	def login
		
		render "login"
	end

	def signup
		render "signup"
	end

	def create_login
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
				flash[:notice] = "niiice login bruh"
				redirect_to user_path(user)
			else
				user.errors.add(:password, "Email and password do not match")
				cookies[:invalid_login] = true
				flash[:invalid_login] = "#{user.errors[:password][0]}"
				# session[:user_email] = 
				redirect_to "/login"
			end
		else #if email is invalid or blank
			cookies[:invalid_login] = true
			if params[:email].empty?
				flash[:invalid_login] = "Email cannot be empty"
			# elsif	params[:password].empty?
			# 	flash[:invalid_login] = "Password cannot be empty"				
			else
				flash[:invalid_login] = "Email and password do not match"
			end
			redirect_to "/login"
		end
	end

	def create_signup
		user = User.new(session_params)
		if user.valid?
			user.save
			session[:user_id] = user.id
			redirect_to user_path(user)				
		else
			user.errors.messages.each do |attr, val|
				flash["invalid_#{attr}"] = "#{attr} #{val[0]}"
			end
			redirect_to "/signup"
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

