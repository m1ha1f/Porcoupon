# == Schema Information
#
# Table name: coupons
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  text        :text(255)
#  image_url   :string(255)
#  deal_url    :string(255)
#  store_url   :string(255)
#  start_at    :datetime
#  end_at      :datetime
#  price       :integer
#  views       :integer
#  redirects   :integer
#  city_id     :integer
#  country_id  :integer
#  category_id :integer
#  store_id    :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  currency    :string(255)
#

class Coupon < ActiveRecord::Base
	belongs_to :country
	belongs_to :city
	belongs_to :store
	belongs_to :category

	composed_of :price,
              :class_name => 'Money',
              :mapping => %w(price cents),
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : Money.empty }
end

