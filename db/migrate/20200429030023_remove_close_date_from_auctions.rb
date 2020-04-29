class RemoveCloseDateFromAuctions < ActiveRecord::Migration[6.0]
  def change
  	remove_column :auctions, :close_date
  end
end
