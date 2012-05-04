# == Schema Information
#
# Table name: coupons
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  text        :text
#  image_url   :string(255)
#  deal_url    :string(255)
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

	def trimmed_text(charNo)
		s = ""
		return "" if text.blank?
		v = text.split()
		index = 0
		while index < v.length && s.length + v[index].length < charNo
			s += " " + v[index]
			index += 1
		end
		s += "..." if index < v.length
		return s	
	end

	def formatted_price
		if price.nil? || price == ""
			return "unknown"
		end
		raise price
		return price.to_s
	end

	composed_of :price,
              :class_name => 'Money',
              :mapping => %w(price cents),
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : Money.empty }
end

