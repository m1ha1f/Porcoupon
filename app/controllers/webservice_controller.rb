class WebserviceController < ApplicationController

	def random_deal
		@title = "Webservice"
		deal = Coupon.order("RANDOM()").first
		response.content_type = Mime::JSON
		render :text => deal.to_json(:only => [:title, :text, :image_url])
	end

	def fblogin
		user = User.find_by_email(params[:email])
		sign_in(user)
		redirect_to user
	end
end
