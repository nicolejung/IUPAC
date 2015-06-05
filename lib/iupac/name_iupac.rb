
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
