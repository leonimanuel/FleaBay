class Bid < ApplicationRecord
	belongs_to :auction
	belongs_to :user

	scope :highest_bidder, -> {
		where(amount: self.maximum(:amount)).all[0]
	}

	# def self.highest_bidder
	# 	where("amount = ?", self.maximum("amount"))
	# end
end
