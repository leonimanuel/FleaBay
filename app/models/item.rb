class Item < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "user_id"
  belongs_to :user

  has_many :item_categories
  has_many :categories, through: :item_categories

  # has_many :bids
  has_many :bidders, class_name: "User"

  belongs_to :auction

  def self.bought(user)
  	closed_auctions = Auction.closed
    items = closed_auctions.collect { |auction| auction.item }
  	items.collect { |item| item.auction.highest_bidder if item.auction.highest_bidder == user}
  end
end
