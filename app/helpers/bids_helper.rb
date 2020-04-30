module BidsHelper
	def open_bids(user)
		auction_array = user.bids.collect { |bid| bid.auction }.uniq
		@open_bids = Auction.where(id: auction_array.map(&:id))
		# user.bids.collect { |bid| bid.auction }.uniq.each.collect { |auction| auction.open == false}
	end
end
