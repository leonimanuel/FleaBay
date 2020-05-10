class Bid < ApplicationRecord
	belongs_to :auction
	belongs_to :user

	# include ActiveModel::Validations
	# validates :amount, presence: true
	validate :amount_must_be_greater_than_highest_bid_amount_or_starting_price
	# OR STARTING PRICE
	# validates_with AmountValidator

	scope :highest_bid, -> {
		where(amount: self.maximum(:amount))
	}

	# def self.highest_bidder
	# 	where("amount = ?", self.maximum("amount"))
	# end

	def amount_must_be_greater_than_highest_bid_amount_or_starting_price
		if self.auction.bids.empty?
			if amount < self.auction.starting_price
				errors.add(:amount, "Your bid must be higher than the starting price!")					
			end
		elsif amount < self.auction.bids.highest_bid.all.first.amount
			binding.pry
			errors.add(:amount, "Your bid must be higher than the current heighest bid! SELF: #{self.auction.bids.highest_bid.all.first.amount}")
		end
	end
end
