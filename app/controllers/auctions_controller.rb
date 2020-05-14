class AuctionsController < ApplicationController
	include UsersHelper
	include AuctionsHelper
	before_action :current_user
	before_action :update_auctions_status

	def index
		@categories = Category.all
		if params[:user_id]
			@auctions = @user.auctions.active
		elsif params[:condition]
			if params[:condition] == "all"
				@auctions = Auction.active
			else
				@auctions = Item.where(condition: params[:condition]).collect { |item| item.auction }				
			end
		elsif params[:category]
			if params[:category] == "all"
				@auctions = Auction.active
			else
				@auctions = Auction.active.select { |auction| auction.categories.include?(Category.find(params[:category][:category_id])) }
			end
		else
			@auctions = Auction.active
		end
	end

	def show
		@auction = Auction.find(params[:id])			

		if session[:invalid_bid]
			@bid = Bid.new(
				amount: session[:invalid_bid]["amount"], 
				auction_id: session[:invalid_bid]["auction_id"], 
				user_id: session[:invalid_bid]["user_id"]
			)
			@bid.valid?
			session.delete :invalid_bid
		else
			@bid = Bid.new			
		end
		if !@auction.bids.empty?
			@highest_bid = @auction.bids.highest_bid.first.amount 
			@highest_bidder = @auction.highest_bidder
		end
	end

	def new
		@auction = Auction.new(user: User.find(params[:user_id]))
		@categories = Category.all
	end

	def create
		auction = Auction.create(auction_params)
		params[:auction][:category].each do |category|
			auction.categories << Category.find_by(name: category)
		end

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

	def category_params
		params.require(:category).permit(:category_id)
	end
end
