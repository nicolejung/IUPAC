#require_relative 'nomenclature.rb'
#require_relative 'name_smiles.rb'
module Iupac_converter


class Name_iupac < String
  include Nomenclature

  #Reg_bracket=/([^(){}\[\]]*)([(){}\[\]])/
  def to_ruby
    
    frag=self
    puts "Compound is "+ self 
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

    x=frag.find_suffix(["ane","an","a"," "])
    frag=x[0] if x

    parent=frag.find_parent
    frag=parent[0] if parent
    l=parent[1]  if parent
    l||=0

    puts "Length is %i, Suffix is %s Position is %s" % [l.to_i,suffix,position.to_s]

    chemical=Array.new(l,[:C])

    if position
      position.each{|po| chemical[po-1]+=[Suffix_Formula[suffix]]}
    end
    chemical||=["failed"]

    prefix=Array.new

    while frag != ""

      #check brackets
      while frag.match(/([\]})])\s*\z/) #(/([\]})])|(\-\s*)\z/)
        puts "Found bracket"

        temp=frag.reverse.find_block

        prefix = temp[0].reverse
        puts prefix.inspect
        frag = temp[1].reverse

        m=frag.find_multiplier
        frag=m[0]if m
        p=frag.find_position
        frag=p[0] if p
        position= (p && p[1..-1]) || []
        if prefix
          if position != []

            temp = Name_iupac.new(prefix.strip[1..-2]).to_ruby
            position.each{|po| chemical[po-1]+=[temp]}
          end #if
        end

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
      if pp && positionp != []
        positionp.each{|po| chemical[po-1]+=[prefix]}
      end

      puts "Prefix is %s and  Position is %s" % [prefix,positionp.to_s]


#begin
      while frag!=""
        re=frag.find_replace
        break if !re
        frag=s[0] if re
        replace=s[1] if re
        
        mp=frag.find_multiplier
        frag=mp[0] if mp
        multp=(mp && mp[1]) || 1

        p1=frag.find_position
        frag=p1[0] if p1
        position1= (p1 && p1[1..-1]) || []

        if position1 && position1 != []
          position1.each{|po| chemical[po-1]+=[replace]}
        end

        puts "The replaced compound is %s and is at %s " % [chain, position1.to_s]
end 
#end

      
      
      
=begin
      
        x=frag.find_chain
        break if !x
        frag=s[0] if x
        chain=s[1] if x

        p1=frag.find_position
        frag=p1[0] if p1
        position1= (p1 && p1[1..-1]) || []

        if position1 && position1 != []
          position1.each{|po| chemical[po-1]+=[chain]}
        end

        puts "Secondary chain is %s and position is %s" % [chain, position1.to_s]
     
=end
    end

    #representation for bonds
    bonds.each_pair do |k,v| v.each do |pos| chemical[pos-1]+=[k]
      end
    end

   # puts "Chemical is" + chemical.to_s
=begin
    ret_out = "Chemical is \n"
    chemical.each_with_index{|c,i| ret_out<<(i+1).to_s<<": "<<c.to_s<<"\n"}
    puts ret_out
=end

    chemical
    


  end # to_ruby

  def outputs

    frag=self
        
      comp=frag.to_ruby
      puts "Chemical is" + comp.to_s
     # puts comp[1].to_s
    
    
  end #outputs

end # of class Name_iupac




class Name_iupac_s < Array
 
 # Reg_bracket=/([^\[\]]*)([\[\]])/
 # ABC=Hash.new{|k,v| k[v]=[]}
  def to_ruby

    frag=self
    print "Start analyzing structure: " 
    p frag
    
    #finding parent chain
    x=find_parent                    
    p x  
    
    #finding affix
    affix=Hash.new{|k,v| k[v]=[]}
    y=frag.each_with_index {|elem, index| a=find_affix(elem[1..-1])  if elem[1]   #elem[1..-1].each{|x| a=x.find_affix#a=find_affix((elem[1..-1]),index) if elem[1]
     if a
        print "affix is " 
        p a 
        print "Position is " 
        p index+1
     a.each{|x|   
     if affix.has_key?(:x)
     affix[x]<<index+1 
     else
     affix[x]<<index+1
     end}
     end}   
      
  print "Affixes are "
  p affix
  abc=Array.new
  abc=affix.keys
  p abc

 #finding suffix:
  suffix=find_suffix_main(abc)
  print "Suffix is = "
  p suffix
  position=find_position(suffix,affix)
  print "Position is "
  p position
  
 #Adjusting affix hash for accuracy
  affix.delete_if{|k,v|  k==suffix}
  p affix
  
 #Finding bond:
  bond=Hash.new{|k,v| k[v]=[]}
  frag.each_with_index{|elem,index| b=find_bond(elem[1..-1])  if elem[1]
if b
        print "Bond is " 
        p b 
        print "Position is " 
        p index+1
     b.each{|x|   
     if affix.has_key?(:x)
     bond[x]<<index+1 
     else
     bond[x]<<index+1
     end}
     end}   
 print "Bonds are "
 p bond
 
  #Forming name:
 name=String.new
    #adding affix names
while affix!= {}
  name<<affix.values[0].join(', ')<<"-"
  #name<<a
  name<<affix.keys[0]<<"-"
  #name<<b
  affix.delete(affix.keys[0])
 # print "affix is "
  #p affix
 
end

 #adding suffix
  name<<position.join(', ')<<"-"
  #name<<a
  name<<suffix<<"-"
  #name<<b

  #adding parent
  name<<x
  print "Name is "
  p name
  
  #adding bond
  bond.each {|k,v| if k!="ane"
    puts "NO"
    name<<v.join(', ')<<"-"
    name<<k<<"-"
  else
    puts "YES"
       name<<"ane"
       break
  end}
 
  puts "---Testing end---"
  end
  
end
end # module
