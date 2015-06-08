require_relative 'name_iupac.rb'
include Nomenclature
class Name_iupac < String
  

  def to_smiles
    
   frag=self
   comp=frag.to_ruby
   
    
    def format_step(e) # Expects an array, since all the elements of data are arrays.
      e.map do |x| # So for each element, get the following
        if x.is_a?(Array)
          "(#{ format_step(x) })" # ...then call the same function on it
        else
          x.to_s # convert to string and return
        end
      end.join # this way map returns an array of strings here, join them
    end
    
    def reformat(data) # This rule is only for the first level and is a bit different
      data.map do |element| # For each element of the root array
        format_step(element) # do this
      end.join(' ') # ..and join the results with spaces
    end
     
    puts format_step(comp)
    puts reformat(comp)
        #x.inspect.gsub(/^\[|\]$|[\:\,\s]/,"").gsub("[","(").gsub("]",")")
       #puts x
        
      # concatenated = Array.new
      # x.each do |x|
      # concatenated.concat(x)
      #end
      

    #puts concatenated


    
  end

  end