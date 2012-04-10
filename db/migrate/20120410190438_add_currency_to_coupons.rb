class AddCurrencyToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :currency, :string

  end
end
