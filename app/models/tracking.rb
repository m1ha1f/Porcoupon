# == Schema Information
#
# Table name: trackings
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  coupon_id     :integer
#  is_redirected :boolean
#  date          :datetime
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#


class Tracking < ActiveRecord::Base
	belongs_to :user
	belongs_to :coupon
end
