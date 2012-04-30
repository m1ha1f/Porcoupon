require 'spec_helper'

describe Coupon do
  pending "add some examples to (or delete) #{__FILE__}"
end
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

