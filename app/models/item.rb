class Item < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "user_id"
  belongs_to :user

  has_many :item_categories
  has_many :categories, through: :item_categories

  # has_many :bids
  has_many :bidders, class_name: "User"

  belongs_to :auction
end
