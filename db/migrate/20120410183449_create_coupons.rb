class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :title
      t.string :text
      t.string :image_url
      t.string :deal_url
      t.string :store_url
      t.datetime :start_at
      t.datetime :end_at
      t.decimal :price
      t.integer :views
      t.integer :redirects
      t.integer :city_id
      t.integer :country_id
      t.integer :category_id
      t.integer :store_id

      t.timestamps
    end
  end
end
