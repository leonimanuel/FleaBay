class ChangeActiveInBids < ActiveRecord::Migration[6.0]
  def change
  	change_column :bids, :active, :boolean, default: true
  end
end
