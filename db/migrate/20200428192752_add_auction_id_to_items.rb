class AddAuctionIdToItems < ActiveRecord::Migration[6.0]
  def change
  	add_column :items, :auction_id, :integer
  end
end
