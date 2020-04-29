class AddOpenToAuctions < ActiveRecord::Migration[6.0]
  def change
  	add_column :auctions, :open, :boolean, default: true
  end
end
