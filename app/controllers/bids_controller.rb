class BidsController < ApplicationController
	include UsersHelper
	before_action :current_user

	def index
		@bids = @user.bids
	end

	def new
		@bid = Bid.new
	end

	def create
		bid = Bid.create(bid_params)

		redirect_to items_path
	end

	def edit
		
	end

	def update
		binding.pry
	end


	private

	def bid_params
		params.require(:bid).permit(:amount, :item_id, :user_id)
	end
end
