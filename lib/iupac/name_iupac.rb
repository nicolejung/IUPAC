include Nomenclature

class Name_iupac < Array
 
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
    bond=Hash.new{|k,v| k[v]=[]}
    y=frag.each_with_index {|elem, index| a=find_affix(elem[1..-1])  if elem[1]   #elem[1..-1].each{|x| a=x.find_affix#a=find_affix((elem[1..-1]),index) if elem[1]
    #y if a[1]
     #  print "YES GOT IT"
=begin
      do { print "Bond  is " 
        p a 
        print "Position is " 
        p index+1
     a.each{|x|   
     if bond.has_key?(:x)
        bond[x]<<index+1 
     else
        bond[x]<<index+1
       end}}
=end   
   #  else  
      if a[0]
        print "Affix is " 
        p a[0] 
        print "Position is " 
        p index+1
     a[0].each{|x|   
     if affix.has_key?(:x)
     affix[x]<<index+1 
     else
     affix[x]<<index+1
end}
elsif a[1]
        print " Bond is " 
        p a[1] 
        print "Position is " 
        p index+1
        a[1].each{|x|   
        if bond.has_key?(:x)
        bond[x]<<index+1 
        else
        bond[x]<<index+1
        end}
else nil
end}   
      
  print "Affixes are " if affix
  p affix              if affix
  if bond.empty?
  else
  print "Bonds are "   
  p bond
  end              
 # abc=Hash.new
  #abc.keys =affix.keys
  #p abc
  
  sorted_affix=affix_sort(affix)

 #finding suffix:
  
  suffix=affix.keys[0]
  print "Suffix is = "
  p suffix
  position=affix.values[0]
  print "Position is "
  p position
  multiplier=find_multiplier(position)
  print "Multiplier is " if multiplier 
  p multiplier           if multiplier
 
  
 #Adjusting affix hash for accuracy
  affix.delete_if{|k,v|  k==suffix}
    p affix
    suffix_=suffix_name(suffix)
    temp = Hash[affix.to_a.reverse]
=begin  
 #Finding bond:
    bond=Hash.new{|k,v| k[v]=[]}
  frag.each_with_index{|elem,index| b=find_bond(elem[1..-1])  if elem[1]
if b
        print "Bond is " 
        p b 
        print "Position is " 
        p index+1
     b.each{|x|   
     if bond.has_key?(:x)
     bond[x]<<index+1 
     else
     bond[x]<<index+1
     end}
     end}   
 print "Bonds are "
 p bond
=end
    
  #Forming name:
 name=String.new
 
    #adding affix names
while temp!= {}
  name<<temp.values[0].join(', ')<<"-"
  if a=find_multiplier(temp.values[0])
    name<<a<<temp.keys[0]<<"-"
  else
    name<<temp.keys[0]<<"-"
end
  temp.delete(temp.keys[0]) 
end

#adding parent
  name<<x
  print "Name is "
  #p name

#adding bond
  if bond.empty?
    if suffix.empty?
      name<<"ane"
    else
      name<<"an"<<"-"
    end
  else
  bond.each {|k,v| puts
    if k!="an"
    name<<v.join(', ')<<"-"<<k<<"-"
  else
       name<<"an"<<"-"
       break
  end}
  end
 
 #adding suffix

 if a=find_multiplier(position)
  name<<position.join(', ')<<"-"<<a<<suffix_
else
name<<position.join(', ')<<"-"<<suffix_
end

  
  p name
  puts "---Testing end---"
  end
  
end