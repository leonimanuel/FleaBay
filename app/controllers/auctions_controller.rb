class AuctionsController < ApplicationController
	include UsersHelper
	before_action :current_user

	def index
		@auctions = @user.auctions
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
		params.permit(:starting_price, :close_time, :user_id)
	end

	def item_params
		params.permit(:name, :condition, :user_id)
	end
end
