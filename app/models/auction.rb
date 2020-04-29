class Auction < ApplicationRecord
	belongs_to :user
	has_one :item
	has_many :bids

	def close_boi(date, time)
		"#{date}, #{time}"
	end
end
