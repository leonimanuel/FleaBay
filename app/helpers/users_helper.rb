module UsersHelper
	def current_user
		@user = User.find_by(id: session[:user_id])
	end

	def is_logged_in?
		!!session[:user_id]
	end

	def purchased_items(user)
		@items = user.bids.map(&:auction).collect do |auction| 
			auction.item if !auction.open && auction.highest_bidder == user
		end
		@items = @items.compact
	end
end
