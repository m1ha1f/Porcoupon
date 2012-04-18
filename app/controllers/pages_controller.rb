class PagesController < ApplicationController
  def home
    @title = "Home"

    ids = Coupon.select("id").select{ |x| x.id};

    sel_ids = []

    for i in 1..15
      sel_ids.push(ids[rand(ids.length)])
    end

    @deals = []
    for i in 0..14
      c = Coupon.find(sel_ids[i])
      if c.image_url == ""
        c.image_url = "http://sfcg.files.wordpress.com/2010/12/imagine.jpg"
      end
      @deals.push(c)
    end

    #@deals = Coupon.order("start_at DESC").limit(15)
    
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
