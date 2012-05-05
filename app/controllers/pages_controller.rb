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

  def deal
    @deal = Coupon.find(params[:id])
    @comments = @deal.comments.to_a
    if params[:is_redirect]
      @deal.redirects += 1
      redirect_to @deal.deal_url
    else
      @deal.views += 1
    end
    @deal.save
  end

  def search
    @deals = []
    if params[:tops] == "views"
      @title = "Most viewed"
      @coupons = Coupon.order("views DESC").limit(10)
      @tops = :views
    elsif params[:tops] == "redirects"
      @title = "Most bought"
      @coupons = Coupon.order("redirects DESC").limit(10)
      @tops = :redirects
    else
      @title = "Search results"
      @coupons = Coupon
        .where("to_tsvector('english', coalesce(title, '') || ' ' 
          || coalesce(text, '')) @@ to_tsquery('english','#{ parseQuery( params[:search] ) }')")
        .paginate(:page => params[:page], :per_page => 10)
    end
  end
end
