class BidsController < ApplicationController
	include UsersHelper
	before_action :current_user

	def index
		@bids = @user.bids
	end

	def new
		@bid = Bid.new(user: User.find(session[:user_id]))
	end

	def create
		bid = Bid.create(bid_params)
		binding.pry

		redirect_to auctions_path
	end

	def edit
		
	end

	def update
		binding.pry
	end


	private

	def bid_params
		params.require(:bid).permit(:amount, :auction_id, :user_id)
	end
end
