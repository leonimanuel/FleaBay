class Bid < ApplicationRecord
	belongs_to :item
	belongs_to :user

	scope :highest, -> {where(amount: self.maximum(:amount))}

end
