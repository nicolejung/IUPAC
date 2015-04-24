#require_relative 'nomenclature.rb'
#require_relative 'name_smiles.rb'
#include Hide_and_seek
include Nomenclature
class Name_iupac < String
  #@left_fragment
  #@rigth_fragment
  #
  def to_ruby
    ###method calling other functions to analyse the input string and store the result into some ruby class
    #frag=self

    puts "## start analyzing compound: "+ self
   
    s=find_suffix 
    frag=s[0] if s
    suffix=s[1] if s
   

    m=frag.find_multiplier
    frag=m[0]if m
    mult=(m && m[1]) || 1

    p=frag.find_position
    frag=p[0] if p
    position=p[1..-1] if p
    position||=[]
      
=begin     
    if suffix=="yne"
      multy=mult
      positiony=position
    end
    
    if suffix=="ene"
      multe=mult
      positione=position
    end
=end
      
bonds=Hash.new

while frag != "" do
      #finding bond
        b=frag.find_bond
        break if !b
        frag=b[0] if b
        bond=b[1] if b
        
        # finding bond multiplier
        mb=frag.find_multiplier 
        frag=mb[0] if mb
        multb=(mb && mb[1]) || 1
        
        #finding bond position
         pb=frag.find_position 
         frag=pb[0] if pb
         positionb=pb[1..-1] if pb    
         positionb||=[]
         bonds[bond]=positionb
=begin  
         if pb
            if positionb != []
               positionb.each{|po| chemical[po-1]+=[prefix]}
            end
         end
=end 
      puts "Bond is %s and  Position is %s" % [bond.to_s,positionb.to_s]
end
 #  puts "_________________"
#bonds.each{|k,v| puts k,v}
 # puts "___________________"

parent=frag.find_parent
    frag=parent[0] if parent
    l=parent[1]  if parent
    l||=0
    
puts "length of main chain is %i, 
suffix is %s position is %s" % [l,suffix,position.to_s]# positiony.length] #positiony.to_s,positione.length,positione.to_s]
#%i alkyne bonds  at positions %s
#%i alkene bonds at positions %s

chemical=Array.new(l,[:C])
  if position
    position.each{|po| chemical[po-1]+=[suffix]}
  end
chemical||=["failed"]  
  
      while frag != ""
      #finding prefix
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
         
        # finding prefix multiplier
        mp=frag.find_multiplier 
        frag=mp[0] if mp
        multp=(mp && mp[1]) || 1
        
        #finding prefix position
         pp=frag.find_position 
         frag=pp[0] if pp
         positionp=pp[1..-1] if pp    
         positionp||=[]
         if pr
            if positionp != []
               positionp.each{|po| chemical[po-1]+=[prefix]}
            end
         end
      
      puts "Prefix is %s and  Position is %s" % [prefix,positionp.to_s]
     
    end
    
   #  bonds.each_pair{|k,v| chemical[v-1]+=["!!!"]}
  
            
    puts "Chemical is "+chemical.to_s

    # todo change this

  end # to_ruby]


  def to_smiles

    ## return a Name_smiles(String) Object
    #Name_smiles.new(...)
  end #to_iupac

end # of class Name_iupac
