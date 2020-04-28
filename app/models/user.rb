class User < ApplicationRecord
	has_secure_password

	has_many :items, foreign_key: :seller_id
	has_many :bids
	
end
