class Category < ApplicationRecord
	has_many :item_categories
	has_many :items, through: :item_categories

	has_many :auction_categories
	has_many :auctions, through: :auction_categories
end
