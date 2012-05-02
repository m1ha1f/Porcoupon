module ApplicationHelper
	def full_title(title)
        base_title = "Porcoupon"
        if title.nil?
            base_title
        else
            "#{base_title} | #{title}"
        end
    end

    def logo
    image_tag("logo.png", :alt => "Porcoupon", :class => "round", :style => "width:170px;height:100px;")
  	end

  	 def signed_in?
    	false
  	end
end
