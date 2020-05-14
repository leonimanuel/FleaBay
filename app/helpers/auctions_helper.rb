module AuctionsHelper
	def update_auctions_status
		Auction.close_expired
	end
end
