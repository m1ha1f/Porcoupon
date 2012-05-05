class ModifyCommentStoreId < ActiveRecord::Migration
  def up
  	rename_column :comments, :store_id, :coupon_id
  end

  def down
  	rename_column :comments, :coupon_id, :store_id
  end
end
