class PagesController < ApplicationController
  
  include PagesHelper

  def home
    @title = "Home"
    
    @deals = Coupon.order("RANDOM()").limit(17)
    
    @dims = [3,2,2,1,1,1,2,3,2,1,1,2,1,2,3,1,1];
    @poz_top= [50,0,100,200,200,100,50,150,100,200,50,250,250,250,250,350,350];
    @poz_left=[75,375,375,375,450,600,675,525,825,825,900,825,0,75,225,150,525];
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

  def deal
    @deal = Coupon.find(params[:id])
    @deal.views += 1
    @deal.save
  end

  def search
    @coupons = Coupon
      .where("to_tsvector('english', coalesce(title, '') || ' ' 
        || coalesce(text, '')) @@ to_tsquery('english','#{ parseQuery( params[:search] ) }')")
      .paginate(:page => params[:page], :per_page => 5)
  end
end
