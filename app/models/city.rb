class City < ActiveRecord::Base
	belongs_to :state
end
# == Schema Information
#
# Table name: cities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  state_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

