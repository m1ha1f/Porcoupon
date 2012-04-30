module PagesHelper
	 def trimm (a, n)
      a = a[0..n]
      i = a.length-1
      while a[i] != ' ' do
        i = i-1
      end
      a = a[0, i]
      return a + "..."
    end
end
