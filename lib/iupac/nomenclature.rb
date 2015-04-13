require_relative 'nomenclature/nomenclature_.rb'
require_relative 'nomenclature/nomenclature_iupac.rb'

class Moiety
attr_reader :locant, :fg , :length 
    
end

class Substituent < Moiety
  
  attr_reader
end

class Parent_hydride
  attr_reader :length , :principal_fg , :principal_fg_locant
  def initialize(opt)
    if opt.is_a?(Integer)
      @length=opt
      @principal_fg_locant = 1
    elsif opt_is_a?(Hash)
      l=opt[:length]
      @length= (l.is_a?(Integer) && l) 
      l=opt[:principal_fg]
      @principal_fg = (l.is_a?(Symbol) && l)
      l=opt[:principal_fg_locant]
      @principal_fg_locant= (l.is_a?(Array) && l) 
     
      
      ## options for non linear parent (e.g. cyclo)  and special name (e.g. benz)
      
      
    else
      
    end
    
    
  end
  
end