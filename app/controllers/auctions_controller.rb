class AuctionsController < ApplicationController
	include UsersHelper
	before_action :current_user

	def index
		
		if params[:user_id]
			@auctions = @user.auctions
		else
			@auctions = Auction.all
		end
	end

	def show
		@bid = Bid.new
		@auction = Auction.find(params[:id])
	end

	def new
		@auction = Auction.new(user: User.find(params[:user_id]))
	end

	def create
		auction = Auction.create(auction_params)
		item = Item.new(item_params)
		item.auction = auction
		item.save
		binding.pry

		redirect_to user_items_path(@user)
	end


	private

	def auction_params
		params.require(:auction).permit(:starting_price, :close_time, :user_id)
	end

	def item_params
		params.require(:auction).permit(:name, :condition, :user_id)
	end
end
