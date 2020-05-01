class CreateAuctionCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :auction_categories do |t|
      t.references :auction, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
