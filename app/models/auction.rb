class Auction < ApplicationRecord
	belongs_to :user
	has_one :item
	has_many :bids

	def self.open
		where("open = ?", true).all
	end
end
