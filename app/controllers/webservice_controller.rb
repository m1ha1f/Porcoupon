class WebserviceController < ApplicationController

	def random_deal
		@title = "Webservice"
		deal = Coupon.order("RANDOM()").first
		response.content_type = Mime::JSON
		render :text => deal.to_json(:only => [:title, :text, :image_url])
	end
end
