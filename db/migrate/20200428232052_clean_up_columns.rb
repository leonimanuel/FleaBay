class CleanUpColumns < ActiveRecord::Migration[6.0]
  def change
  	add_column :bids, :auction_id, :integer
  	add_column :auctions, :starting_price, :float
  	remove_column :items, :start_price
  	remove_column :items, :time_remaining
  end
end
