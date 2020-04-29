class RemoveItemIdFromBids < ActiveRecord::Migration[6.0]
  def change
  	remove_column :bids, :user_id
  end
end
