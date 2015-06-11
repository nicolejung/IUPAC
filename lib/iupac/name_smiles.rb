require_relative 'name_iupac.rb'
include Nomenclature
class Name_iupac < String
  

  def to_smiles
    
   frag=self
   comp=frag.to_ruby
   
    
    def format_step(e) 
      e.map do |x| 
        if x.is_a?(Array)
          "(#{ format_step(x) })" # calling the same function 
        else
          x.to_s # convert to string and return
        end
      end.join # map returns an array of strings, join
    end
    
    def reformat(data) 
      data.map do |element| 
        format_step(element) 
      end.join('') #Joining with space 
    end
     
    
    #puts format_step(comp)
    puts reformat(comp)
    
    
        #x.inspect.gsub(/^\[|\]$|[\:\,\s]/,"").gsub("[","(").gsub("]",")")
       #puts x
        

    
  end

  end