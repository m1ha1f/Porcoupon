# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  store_id   :integer
#  rating     :integer
#  user_id    :integer
#  text       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :store
end
