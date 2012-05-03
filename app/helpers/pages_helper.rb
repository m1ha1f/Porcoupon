module PagesHelper
	
	def parseQuery( query )
      query = query.strip # elimin blancurile de la inceputul si sfarsitul sirului
      return if (query.nil?) || (query.empty?)
    
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
end
