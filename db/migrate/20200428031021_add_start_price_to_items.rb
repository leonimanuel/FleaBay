class AddStartPriceToItems < ActiveRecord::Migration[6.0]
  def change
  	add_column :items, :start_price, :float
  end
end
