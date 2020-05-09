class Bid < ApplicationRecord
	belongs_to :auction
	belongs_to :user

	validates :amount, presence: true

	scope :highest_bid, -> {
		where(amount: self.maximum(:amount))
	}

	# def self.highest_bidder
	# 	where("amount = ?", self.maximum("amount"))
	# end
end
