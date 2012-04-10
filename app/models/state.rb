class State < ActiveRecord::Base
	belongs_to :country
	has_many   :cities
end
# == Schema Information
#
# Table name: states
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  country_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

