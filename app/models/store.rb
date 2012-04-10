# == Schema Information
#
# Table name: stores
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Store < ActiveRecord::Base
	attr_accesible :name
	has_many :comments
	has_many :coupons
end

