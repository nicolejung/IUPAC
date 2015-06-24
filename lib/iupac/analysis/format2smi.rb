module Iupac_converter
  class Name_ruby  < Array
    

    def format2smi
      # return a SMiles compliant chemical name as a string
      
      map do |element|
        format_step(element)
      end.join('') 
      
    end # format2smi
    
    protected
    
    def format_step(e)
      e.map do |x|
        if x.is_a?(Array)
          "(#{ format_step(x) })" # calling the same function
        else
          x.to_s # convert to string and return
        end
      end.join # map returns an array of strings, join
    end

  end #class Name_ruby

end #module Iupac_converter