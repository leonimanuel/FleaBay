class User < ApplicationRecord
	has_secure_password
	# before_validation :set_password
	validates :name, presence: true	
	validates :email, presence: true
	validates :email, uniqueness: true


	has_many :items #inverse_of: "seller"
	has_many :bids
	
	has_many :auctions

	def set_password
		self.password_digest = SecureRandom.urlsafe_base64
	end
end
