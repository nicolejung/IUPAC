#require_relative 'nomenclature.rb'
#require_relative 'name_smiles.rb'
include Nomenclature
#include Hide_and_seek

class Name_iupac < String
  #@left_fragment
  #@rigth_fragment
  
  Reg_bracket=/([^(){}\[\]]*)([(){}\[\]])/
  
  def to_ruby
    ###method calling other functions to analyse the input string and store the result into some ruby class
     frag=self 
     
          
   
            
    x=frag.find_block.to_s
     
       
 def final  
    
       
    puts "compound is "+ self

    s=self.find_suffix
    frag=s[0] if s
    suffix=s[1] if s

    m=frag.find_multiplier
    frag=m[0]if m
    mult=(m && m[1]) || 1

    p=frag.find_position
    frag=p[0] if p
    position= (p && p[1..-1]) || []

    a=frag.find_suffix(["ane","an", "en","yne"])
    frag=a[0] if a
    
    parent=frag.find_parent
    frag=parent[0] if parent
    l=parent[1]  if parent

    secundary_fg=frag
    puts "Suffix is %s Length is %i position is %s" % [suffix,l.to_i,position.to_s]

    l||=0

    chemical=Array.new(l,[:C])

    if position
      position.each{|po| chemical[po-1]+=[suffix]}
    end
    #chemical||=["failed"]

    while frag != ""

      pr=frag.find_affix
      break if !pr
      frag=pr[0] if pr
      prefix=pr[1] if pr
      if prefix == "yl"
       nx_pos=frag.find_next_position
       
        #   "+nx_pos.to_s
       if nx_pos
       frag=Name_iupac.new(nx_pos[0..1].join)
       
       
       prefix=nx_pos[2]+prefix
       end
      end
      
      #find multiplier
      
      m=frag.find_multiplier
      frag=m[0]if m
      mult=(m && m[1]) || 1
      
      #find position
      p=frag.find_position
      frag=p[0] if p
      position= (p && p[1..-1]) || []
      puts "Prefix is %s and  Position is %s" % [prefix,position.to_s]
      if pr
        if position != []
          position.each{|po| chemical[po-1]+=[prefix]}
        end #if 
      end
    end

    puts "Chemical is "+chemical.to_s

    # todo change this
    
end #final 

  end # to_ruby

  def to_smiles

    ## return a Name_smiles(String) Object
    #Name_smiles.new(...)

  end #to_iupac

end # of class Name_iupac

