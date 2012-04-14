class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def about
  	@title = "About"
  end

  def tops
  	order_by = :error
  	if params[:by] == "views"
  		@title = "Most viewed"
  		order_by = :views
      @criteria = "Views"
  	elsif params[:by] == "redirects"
  		@title = "Most bought"
  		order_by = :redirects
  	  @criteria = "Redirects"
    end
  	@deals = []
  	if order_by != :error
  		@deals = Coupon.order(order_by).limit(10)
  	end
  end
end
