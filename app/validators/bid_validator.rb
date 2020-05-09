class AmountValidator < ActiveModel::Validator
	def validate(bid)
		# if bid.amount
		# 	if bid.amount < bid.auction.highest_bid
		# 		record.errors[:amount] << "Your bid must be higher than the current heighest bid!"
		# 	end
		# end
	end
end