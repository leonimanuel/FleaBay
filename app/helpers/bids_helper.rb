module BidsHelper
	def open_bids(user)
		# user.bids.collect { |bid| bid.auction }.uniq.open.all
		user.bids.collect { |bid| bid.auction }.uniq.each.collect { |auction| auction.open == false}
	end
end
