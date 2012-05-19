class PagesController < ApplicationController
  
  include PagesHelper

  def home
    @title = "Home"
    
    @deals = Coupon.order("RANDOM()").limit(15)
    
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

  def deal
    @deal = Coupon.find(params[:id])
    @comments = @deal.comments.paginate(:page => params[:page], :per_page => 10)
    @related_coupons = Coupon
      .where("title != '#{@deal.title.gsub(/\\/, '\&\&').gsub(/'/, "''")}' AND (to_tsvector('english', coalesce(title, '') || ' ' 
        || coalesce(text, '')) @@ to_tsquery('english','#{ parseQuery( getSomeWords_deal(@deal.title) ) }'))")
      .order("views DESC").limit(5)

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
		results_per_page = 10
		@coupons = Coupon
			.where("to_tsvector('english', coalesce(title, '') || ' ' 
			|| coalesce(text, '')) @@ to_tsquery('english','#{ parseQuery( params[:search] ) }')")
			.paginate(:page => params[:page], :per_page => results_per_page)
		
		searchType = :basicSearch		
		if !params[:advanced_search].blank? then
			if !params[:advanced_search][:city_id].blank? then
				if !params[:advanced_search][:category_id].blank? then
					searchType = :searchByCityByCategory
				else
					searchType = :searchByCity
				end
			elsif !params[:advanced_search][:category_id].blank? then
				searchType = :searchByCategory
			end	
		end
		
		if searchType == :basicSearch then
			@coupons = Coupon
				.where("to_tsvector('english', coalesce(title, '') || ' ' 
				|| coalesce(text, '')) @@ to_tsquery('english','#{ parseQuery( params[:search] ) }')")
				.paginate(:page => params[:page], :per_page => results_per_page)
		elsif searchType == :searchByCity then
			@coupons = Coupon
				.where("coupons.city_id = #{params[:advanced_search][:city_id]} AND (to_tsvector('english', coalesce(title, '') || ' ' 
				|| coalesce(text, '')) @@ to_tsquery('english','#{ parseQuery( params[:search] ) }'))")
				.paginate(:page => params[:page], :per_page => results_per_page)
		elsif searchType == :searchByCategory then
			@coupons = Coupon
				.where("coupons.category_id = #{params[:advanced_search][:category_id]} AND
				(to_tsvector('english', coalesce(title, '') || ' ' || coalesce(text, '')) 
				@@ to_tsquery('english','#{ parseQuery( params[:search] ) }'))")
				.paginate(:page => params[:page], :per_page => results_per_page)
		elsif searchType == :searchByCityByCategory then
			@coupons = Coupon
				.where("coupons.city_id = #{params[:advanced_search][:city_id]} AND coupons.category_id = #{params[:advanced_search][:category_id]} AND
				(to_tsvector('english', coalesce(title, '') || ' ' || coalesce(text, '')) 
				@@ to_tsquery('english','#{ parseQuery( params[:search] ) }'))")
				.paginate(:page => params[:page], :per_page => results_per_page)
		end
    end

  end

  def browsecategories 
    @categories = Category.all

    if !params[:category_id].blank? then
      @results = Coupon.where("category_id = #{params[:category_id]}").paginate(:page => params[:page], :per_page => 10)
    else
      @results = Coupon.paginate(:page => params[:page], :per_page => 10)
    end
  end
end
