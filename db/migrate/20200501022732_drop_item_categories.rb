class DropItemCategories < ActiveRecord::Migration[6.0]
  def change
  	drop_table :item_categories
  end
end
