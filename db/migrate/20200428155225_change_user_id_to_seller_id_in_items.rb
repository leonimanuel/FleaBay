class ChangeUserIdToSellerIdInItems < ActiveRecord::Migration[6.0]
  def change
  	rename_column :items, :user_id, :seller_id
  end
end
