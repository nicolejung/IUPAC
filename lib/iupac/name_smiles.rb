require_relative 'name_iupac.rb'

class Name_smiles < Array


  def to_iupac
    
    ###method calling other function to analyse the input string
    
    
    
    name="prop-2-ol"
    # return a Name_iupac(String) Object
    Name_iupac.new(name)
  end #to_iupac
  
  
  
end # of class Iupac_smiles