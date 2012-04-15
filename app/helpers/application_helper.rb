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
    image_tag("logo.jpg", :alt => "Porcoupon", :class => "round")
  	end

  	 def signed_in?
    	false
  	end
end
