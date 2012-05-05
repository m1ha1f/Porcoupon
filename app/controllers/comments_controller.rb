class CommentsController < ApplicationController

	def create
		coupon = Coupon.find(params[:coupon_id])
		coupon.comments.create!(:user_id => current_user.id, :text => params[:text])
		redirect_to deal_path + "?id=#{coupon.id}"
	end
end