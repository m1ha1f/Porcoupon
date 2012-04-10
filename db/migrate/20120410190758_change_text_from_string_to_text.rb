class ChangeTextFromStringToText < ActiveRecord::Migration
  def up
  	change_column :coupons, :text, :text
  end

  def down
  	change_column :coupons, :text, :string
  end
end
