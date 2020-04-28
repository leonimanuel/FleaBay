class BidsController < ApplicationController
	def new
		@bid = Bid.new
	end

	def create
		binding.pry
		bid = Bid.create(bid_params)
	end

	def edit
		
	end

	def update
		binding.pry
	end


	private

	def bid_params
		params.require(:bid).permit(:amount, :user_id)
	end
end
