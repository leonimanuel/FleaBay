class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.datetime :close_time

      t.timestamps
    end
  end
end
