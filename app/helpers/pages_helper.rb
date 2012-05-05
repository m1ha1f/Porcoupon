module PagesHelper
	
	def parseQuery( query )
      return if query.blank?
      query = query.strip # elimin blancurile de la inceputul si sfarsitul sirului
          
      words = "" # query string for ts_query
      
      query = query.gsub(/[^a-zA-Z0-9 ]+/, '') # elimin orice caracter care nu este litera si il inlocuiesc cu blanc
      query.split(/\s+/).each do |w| # parcurg fiecare cuvant
        next if w.empty?
        if !words.empty? then
          words += " & " + w.downcase
        else
          words = w.downcase
        end
      end
      return words
    end
	
	def getSomeWords_deal( text )
		text = text.strip 
		return "" if (text.nil?) || (text.empty?)
		words = []
		text.split("\n").each do |line|
			line_cnt = line.gsub(/[^a-zA-Z]+/, ' ') 
			line_cnt.split(/\s+/).each do |w|
				next if w.empty?
				w = w.downcase
				words << w
			end
		end
		
		words = words.sort_by {|w| w.length}.reverse
		return words[0]
		#i = 0
		#string = ""
		#words.each do |w|
		#	if string.empty? then
		#		string = w
		#	elsif i < 1 then
		#		string += " || " + w
		#	end
		#	i += 1
		#end
		
		#return string
	end
end
