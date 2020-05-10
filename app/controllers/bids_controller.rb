class BidsController < ApplicationController
	include UsersHelper
	include BidsHelper
	before_action :current_user

	def index
		open_bids(@user)
		closed_bids(@user)
	end

	def new
		@bid = Bid.new(user: User.find(session[:user_id]))
	end

	def create
		@bid = Bid.new(bid_params)
		binding.pry
		if @bid.valid?
			@bid.save
			redirect_to auction_path(params[:bid][:auction_id])
		else
			# need to somehow keep this definition of bid
			# redirect_to auction_path(params[:bid][:auction_id])

			@auction = Auction.find(params[:bid][:auction_id])
			# render :"auctions/show"
			session[:invalid_bid] = @bid
			redirect_to auction_path(params[:bid][:auction_id])
		end
		# @bid = Bid.create(bid_params)
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
