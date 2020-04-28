class BidsController < ApplicationController
	def new
		@bid = Bid.new
	end

	def create
		bid = Bid.create(bid_params)
		binding.pry

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
