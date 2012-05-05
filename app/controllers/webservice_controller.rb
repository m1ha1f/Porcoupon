class WebserviceController < ApplicationController

	def random_deal
		@title = "Webservice"
		deal = Coupon.order("RANDOM()").first
		response.content_type = Mime::JSON
		a = {:i => params[:i], :title => deal.title, :text => deal.text, :image_url => deal.image_url, :price => deal.formatted_price }
		render :text => a.to_json()
	end
end
