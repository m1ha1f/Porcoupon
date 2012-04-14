# == Schema Information
#
# Table name: users
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  email       :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  password    :string(255)
#  facebook_id :integer
#  bayes       :binary
#  user_type   :integer
#

class User < ActiveRecord::Base
	attr_accessible :name, :email, :user_type
	has_many :comments
end
