class Bid < ApplicationRecord
	belongs_to :auction
	belongs_to :user

	# scope :highest, -> {
	# 	where(amount: self.maximum(:amount))
	# }

	def self.highest
		
	end

end
