class AddCloseDateToAuctions < ActiveRecord::Migration[6.0]
  def change
  	add_column :auctions, :close_date, :date
  end
end
