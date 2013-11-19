module PostMastersHelper

	def bg_select(post_count)
		 if post_count == 3 
         style = "background-color: #81BEF7"
        else
          style = "background-color: white"  
        end 
	end

end
