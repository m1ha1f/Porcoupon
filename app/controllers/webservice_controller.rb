class WebserviceController < ApplicationController

	def random_deal
		@title = "Webservice"
		deal = Coupon.order("RANDOM()").first
		response.content_type = Mime::JSON
		a = {:i => params[:i], :id => deal.id, :title => deal.title, :text => deal.trimmed_text(200), :image_url => deal.image_url, :price => deal.formatted_price }
		render :text => a.to_json()
	end

	def fblogin
		user = User.find_by_email(params[:email])
		if !user.nil?
			
		else
			user = user.create(:name => params[:name], :email => params[:email], :password => "porcoupon123561")
		end
		sign_in(user)
			redirect_to user
	end

	# def fbsignup
	# 	user = User.find_by_email(params[:email])
	# 	if !user.nil?
	# 		sign_in(user)
	# 		redirect_to user
	# 	end
	# end
end
