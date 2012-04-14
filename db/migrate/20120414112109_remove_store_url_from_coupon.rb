class RemoveStoreUrlFromCoupon < ActiveRecord::Migration
  def up
    remove_column :coupons, :store_url
      end

  def down
    add_column :coupons, :store_url, :string
  end
end
