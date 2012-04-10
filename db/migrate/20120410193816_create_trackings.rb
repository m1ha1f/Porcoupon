class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.integer :user_id
      t.integer :coupon_id
      t.boolean :is_redirected
      t.datetime :date

      t.timestamps
    end
  end
end
