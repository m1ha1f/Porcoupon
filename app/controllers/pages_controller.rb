class PagesController < ApplicationController
  def home
    @title = "Home"
    @deals = Coupon.order("start_at DESC").limit(15)
    
    @dims = [3, 2, 2, 3, 2, 2, 2, 3, 2, 1, 1, 2, 1, 1, 1];
    @poz_top= [10,10,130,10,10,130,250,250,250,250,310,250,250,370,370];
	  @poz_left=[10,370,370,550,910,910,10,190,550,730,730,820,1000,100,550];
    
  end

  def contact
    @title = "Contact"
  end

  def about
  	@title = "About"
  end

  def tops
  	order_by = ""
  	if params[:by] == "views"
  		@title = "Most viewed"
  		order_by = "views"
      @criteria = "Views"
  	elsif params[:by] == "redirects"
  		@title = "Most bought"
  		order_by = "redirects"
  	  @criteria = "Redirects"
    end
  	@deals = []
  	if order_by != ""
  		@deals = Coupon.order("#{order_by} DESC").limit(10)
  	end
  end
end
