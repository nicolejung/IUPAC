
#require_relative 'nomenclature.rb'
#require_relative 'name_smiles.rb'
include Nomenclature

class Name_iupac < String
        
  def to_ruby
            #method calling other functions to analyse the input string and store the result into some ruby class
     frag=self 
      
       
    puts "Compound is "+ self

    s=self.find_suffix
    frag=s[0] if s
    suffix=s[1] if s

    m=frag.find_multiplier
    frag=m[0]if m
    mult=(m && m[1]) || 1

p=frag.find_position
   frag=p[0] 
   if p == nil
     position=[]
   elsif p
   position= (p && p[1..-1]) || []
end     

      
   
bonds=Hash.new

while frag != "" 
  
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


    a=frag.find_suffix(["ane","an","a", "en", "yne", ""])   #"en","yne"])
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
              #check brackets 
      
      if frag.match(/([\]})])\s*\z/) #(/(\(|\{|\[|\]|\}|\)\s*\z)/) #(/([\]})])\s*\z/)
        puts "found bracket"
         
     temp=frag.reverse.find_block
      
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
      
      #frag.to_ruby 
     
      end


pr=frag.find_affix
break if !pr
frag=pr[0] if pr 
prefix=[pr[1]] if pr      

if prefix[0] == "yl"
  yl_=frag.find_group

    if yl_ 
      frag=yl_[0]
      yl_group=Name_iupac.new(yl_[1...-1].join)
      prefix=yl_group.to_ruby
      y=frag.extra_pos
      frag=y[0] if y 
    end
else 
  prefix=[Affix_Formula[prefix[0]]]
 end
 
 
      #if no bracket
      pr=frag.find_affix
      break if !pr 
      
      frag=pr[0] if pr
      prefix=pr[1] if pr
      if prefix[0] == "yl"      
       nx_pos=frag.find_next_position
       if nx_pos
         frag=Name_iupac.new(nx_pos[0..1].join)
         prefix=nx_pos[2]+prefix
       end
      end   #if bracket 

           
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
   
    
    bonds.each_pair do |k,v| v.each do |pos| chemical[pos-1]+=[k] 
end 
end

    puts "Chemical is "+chemical.to_s

    
    chemical.to_a
    
           #puts chemical.flatten
=begin
           concatenated = Array.new
           chemical.each do |chemical|
           concatenated.concat(chemical)
           end
           
       puts concatenated
=end   
 
  chemical.to_s  
  
  end # to_ruby
 
  
  def to_smiles
    
    
                     
  end #to_smiles

end # of class Name_iupac

