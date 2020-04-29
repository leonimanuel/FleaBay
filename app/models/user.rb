class User < ApplicationRecord
	has_secure_password

	has_many :items #inverse_of: "seller"
	has_many :bids
	
	has_many :auctions
end
