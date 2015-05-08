<<<<<<< HEAD
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

    puts "## start analyzing compound: "+ self
   
    s=find_suffix 
    frag=s[0] if s
    suffix=s[1] if s
    suffix||=nil

if s
    m=frag.find_multiplier
    frag=m[0]if m
    mult=(m && m[1]) || 1 if m

    p=frag.find_position
    frag=p[0] if p
    position=p[1..-1] if p || 1
      
end 

  #storing bond information in a hash    
      
bonds=Hash.new

while frag != "" do
      #finding bond
        b=frag.find_bond
        break if !b
        frag=b[0] if b
        bond=b[1] if b

      if b  
        # finding bond multiplier
        mb=frag.find_multiplier 
        frag=mb[0] if mb
        multb=(mb && mb[1]) || 1
      
        #finding bond position
         pb=frag.find_position 
         frag=pb[0] if pb
         positionb=pb[1..-1] if pb 
         bonds[bond]=positionb  
         positionb||=[]

           #finding bond representation
           find_rep(bonds)

      puts "Bond is %s and  Position is %s" % [bond.to_s,positionb.to_s]
end
end

x=frag.find_suffix(["ane","an","a"])
  frag=x[0] if x
  #frag||= frag
  
parent=frag.find_parent
    frag=parent[0] if parent
    l=parent[1]  if parent
    l||=0
    
puts "length of main chain is %i, 
suffix is %s position is %s" % [l,suffix,position.to_s]

chemical=Array.new(l,[:C])
  if position
    position.each{|po| chemical[po-1]+=[suffix]}
  end
chemical||=["failed"]  
  
  prefix=Array.new
      
  while frag != ""
    #prefix=nil
    #finding prefix
  
        pr=frag.find_affix
      break if !pr
        frag=pr[0] if pr 
        prefix=[pr[1]] if pr      
        
        if prefix[0] == "yl"
          yl_=frag.find_group
       
          #nx_pos=frag.find_next_position
          #   "+nx_pos.to_s
            if yl_ #nx_pos        
              #frag=Name_iupac.new(nx_pos[0..1].join)
              #frag.to_ruby
              frag=yl_[0]
              yl_group=Name_iupac.new(yl_[1...-1].join)
              prefix=yl_group.to_ruby
        #      prefix=chemical.to_s
              y=frag.extra_pos
              frag=y[0] if y
              
              #prefix=nx_pos[2]+prefix
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
         
          #finding representation 
          if pr
            if positionp != [] 
               positionp.each{|po| chemical[po-1]+=[prefix]} #Affix_smiles[prefix]
            end
         end
      puts "Prefix is %s and  Position is %s" % [prefix,positionp.to_s]
     
    end

    #representation for bonds   
bonds.each_pair do |k,v| v.each do |pos| chemical[pos-1]+=[k] end end


 #prefix=chemical.to_s
#prefix.map!{ |element| element=chemical.each{|elem|}
 #}
 # prefix=chemical.to_s   
  #puts "******"
   #        p prefix
    #       puts "******"
            
    puts "Chemical is "+chemical.to_s

puts "---Testing end---"
  chemical.to_s
end # to_ruby]

  def to_smiles

    ## return a Name_smiles(String) Object
    #Name_smiles.new(...)
  end #to_iupac

end # of class Name_iupac
=======
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
      
       
    puts "Compound is "+ self

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
      position.each{|po| chemical[po-1]+=[Suffix_Formula[suffix]]} 
    end
    #chemical||=["failed"]

    while frag != ""
              #check bracketsa
      if frag.match(/([\]})])\s*\z/)
        puts  "found bracket"
      temp= frag.reverse.find_block
      
      prefix = temp[0].reverse
      frag = temp[1].reverse
      
      m=frag.find_multiplier
          frag=m[0]if m
      p=frag.find_position
      frag=p[0] if p
       position= (p && p[1..-1]) || []
      if prefix
        if position != []
          position.each{|po| chemical[po-1]+=[prefix]}
        end #if 
      end
      position=[]
      end
      # if (frag=="(" || frag=="[" ||frag=="{") || (frag==")" || frag=="]" ||frag=="}") 
     #   frag.xyz(self)
      #  puts "Sidechain is " + frag.xyz.to_s
         
      #if no bracket
      pr=frag.find_affix
      break if !pr
      
      frag=pr[0] if pr
      prefix=pr[1] if pr
      if prefix == "yl"
       nx_pos=frag.find_next_position
       if nx_pos
         frag=Name_iupac.new(nx_pos[0..1].join)
         prefix=nx_pos[2]+prefix
       end
      end
    #if bracket 

    #find corresponding bracket & group
          
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
          position.each{|po| chemical[po-1]+=[Affix_Formula[prefix]]}
        end #if 
      end
    end

    puts "Chemical is "+chemical.to_s

    # todo change this thing

  end # to_ruby

  def to_smiles

    ## return a Name_smiles(String) Object
    #Name_smiles.new(...)

  end #to_iupac

end # of class Name_iupac
>>>>>>> origin/mohit_iupac
