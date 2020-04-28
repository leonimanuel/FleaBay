module UsersHelper
	def current_user
		@user = User.find_by(id: session_hash[:user_id])
	end

	def is_logged_in?
		!!session_hash[:user_id]
	end
end
