require_relative 'name_iupac.rb'
include Nomenclature
class Name_iupac < String
  

  def to_smiles
    
    frag=self
    
   
   x=frag.to_ruby
   
    puts x.flatten
    
        concatenated = Array.new
        x.each do |x|
        concatenated.concat(x)
        end

    puts concatenated


    
  end

  end