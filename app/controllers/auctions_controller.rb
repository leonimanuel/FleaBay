class AuctionsController < ApplicationController
	include UsersHelper
	before_action :current_user
	# before_auction :close_expired

	def index
		if params[:user_id]
			@auctions = @user.auctions.open
		else
			@auctions = Auction.open
		end
	end

	def show
		@auction = Auction.find(params[:id])
		@bid = Bid.new
		
		if !@auction.bids.empty?
			@highest_bid = @auction.bids.highest_bid.first.amount 
			@highest_bidder = @auction.highest_bidder
		end

	end

	def new
		@auction = Auction.new(user: User.find(params[:user_id]))
	end

	def create
		binding.pry
		auction = Auction.create(auction_params)
		item = Item.new(item_params)
		item.auction = auction
		item.save

		redirect_to user_auctions_path(@user)
	end


	private

	def auction_params
		params.require(:auction).permit(:starting_price, :close_time, :user_id)
	end

	def item_params
		params.require(:auction).permit(:name, :condition, :user_id)
	end
end
