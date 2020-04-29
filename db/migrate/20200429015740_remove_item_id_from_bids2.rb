class RemoveItemIdFromBids2 < ActiveRecord::Migration[6.0]
  def change
  	remove_column :bids, :item_id
  	add_column :bids, :user_id, :integer
  end
end
