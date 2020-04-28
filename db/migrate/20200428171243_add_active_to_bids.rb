class AddActiveToBids < ActiveRecord::Migration[6.0]
  def change
  	add_column :bids, :active, :boolean
  end
end
