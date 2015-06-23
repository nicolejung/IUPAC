#require_relative 'nomenclature.rb'
#require_relative 'name_smiles.rb'
include Nomenclature
#include Hide_and_seek

class Name_iupac < String
   #@left_fragment
   #@rigth_fragment
   #
  def to_ruby
    ###method calling other functions to analyse the input string and store the resutl into some ruby class
    frag=self
    puts "compound is "+ self
   
    s=frag.find_suffix 
    frag=s[0] if s
    suffix=s[1] if s
    
    m=frag.find_multiplier
    frag=m[0]if m
    mult=(m && m[1]) || 1

    p=frag.find_position 
    frag=p[0] if p
    position=p[1..-1] if p
    
    
    a=frag.find_affix 
    frag=a[0] if a
    
    parent=frag.find_parent
    frag=parent[0] if parent
    l=parent[1]  if parent
    l||=1
    
    secundary_fg=frag
    puts "suffix is %s length is %i position is %s" % [suffix,l,position.to_s]
    
   
      
    chemical=Array.new(l,[:C]) 
      
    if position
       position.each{|po| chemical[po-1]+=[suffix]}
    end
    chemical||=["failed"]
    
    puts "chemical is "+chemical.to_s
  
       
    # todo change this
    
  end # to_ruby 
  
  
  def to_smiles
     
    ## return a Name_smiles(String) Object
     #Name_smiles.new(...)   
    
  end #to_iupac
  

end # of class Name_iupac

