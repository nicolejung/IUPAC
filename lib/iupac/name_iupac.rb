#require_relative 'nomenclature.rb'
#require_relative 'name_smiles.rb'


class Name_iupac < String
include Nomenclature
include Hide_and_seek 
  
  def to_ruby
    ###method calling other functions to analyse the input string and store the resutl into some ruby class
    find_suffix 
    puts "compound is "+self
    self   # todo change this
    
  end # to_ruby 
  
  
  def to_smiles
     
    ## return a Name_smiles(String) Object
     #Name_smiles.new(...)   
    
  end #to_iupac
  

end # of class Name_iupac