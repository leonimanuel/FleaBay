module BidsHelper
	def open_bids(user)
		auction_array = user.bids.collect { |bid| bid.auction }.uniq
		@open_bids = Auction.where(id: auction_array.map(&:id)).active
		# user.bids.collect { |bid| bid.auction }.uniq.each.collect { |auction| auction.open == false}
	end

	def closed_bids(user)
		auction_array = user.bids.collect { |bid| bid.auction }.uniq
		@closed_bids = Auction.where(id: auction_array.map(&:id)).closed
		# user.bids.collect { |bid| bid.auction }.uniq.each.collect { |auction| auction.open == false}
	end

	def invalidBid(bid)
		bid
	end
end
