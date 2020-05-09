class Bid < ApplicationRecord
	belongs_to :auction
	belongs_to :user

	# include ActiveModel::Validations
	# validates :amount, presence: true
	validate :amount_must_be_greater_than_highest_bid_amount
	# validates_with AmountValidator

	scope :highest_bid, -> {
		where(amount: self.maximum(:amount))
	}

	# def self.highest_bidder
	# 	where("amount = ?", self.maximum("amount"))
	# end

	def whatsHappening
		self.auction.bids.highest_bid
	end

	def amount_must_be_greater_than_highest_bid_amount
		if amount < self.auction.bids.highest_bid.all.first.amount
			errors.add(:amount, "Your bid must be higher than the current heighest bid! SELF: #{self.auction.bids.highest_bid.all.first.amount}")
		end
	end
end
