class AuctionsController < ApplicationController
	include UsersHelper
	before_action :current_user
	# before_auction :close_expired

	def index
		binding.pry
		@categories = Category.all

		if params[:user_id]
			@auctions = @user.auctions.active
		elsif params[:condition]
			@auctions = Item.where(condition: params[:condition]).collect { |item| item.auction }
		elsif params[:category]
			@auctions = Auction.all.select { |auction| auction.categories.include?(Category.find(params[:category][:category_id])) }
			binding.pry
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
			# @bid = Bid.new			
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
		binding.pry

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
