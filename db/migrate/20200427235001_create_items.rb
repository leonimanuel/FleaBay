class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.string :condition
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :time_remaining
      t.boolean :sold

      t.timestamps
    end
  end
end
