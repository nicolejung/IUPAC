require_relative 'name_iupac.rb'
class Name_smiles < Array

class Array
def to_smiles
  
    a=""    # empty string
      
    a.each {|e,i|}  
           if e.is_a?(Array)
                 a<<e.to_smiles
           else exit(0) 
              ## do something about the element 
           end
  
         return  #self
  end
  end

              
        
  
  def to_iupac
    
    ###method calling other function to analyse the input string
    
    
    
    name="prop-2-ol"
    # return a Name_iupac(String) Object
    Name_iupac.new(name)
  end #to_iupac
     
      end 