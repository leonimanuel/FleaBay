class Auction < ApplicationRecord
	belongs_to :user
	has_one :item
	has_many :bids

	def self.open
		where(open: true).all
	end

	def self.expired
		where("close_time < ?", Time.now)
	end

	def self.closed
		where(open: false).all
	end

	def self.close_expired
		where("close_time < ?", Time.now).update(open: false)
	end

	def highest_bidder
		self.bids.highest_bid.first.user
	end
end
