class ChangePriceToInteger < ActiveRecord::Migration
  def up
  	change_column :coupons, :price, :integer
  end

  def down
  	change_column :coupons, :price, :decimal
  end
end
