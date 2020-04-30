class BidsController < ApplicationController
	include UsersHelper
	include BidsHelper
	before_action :current_user

	def index
		open_bids(@user)
	end

	def new
		@bid = Bid.new(user: User.find(session[:user_id]))
	end

	def create
		bid = Bid.create(bid_params)

		redirect_to auction_path(params[:bid][:auction_id])
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
