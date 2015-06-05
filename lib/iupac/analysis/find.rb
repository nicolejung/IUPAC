
  
  class Name_iupac  < Array
 
    Reg_bracket=/([^\[\]]*)([\[\]])/
    Abc=Hash.new
  def find_suffix(suf,suffix)

    if !suf
      suffix = Affix_Formula
 #   elsif suf.is_a?(Array)
  #    suffix=[suf]  
  else 

    suffix= suffix
    end
  # Abc=Hash.new
    #keys=Abc.keys
     suffix.each{|k,v| a=suf.match(/#{v}\z/i)
                     if $&
                      # print "***"
                       #p  $&  
                    #   if Abc.has_key?(:a)
                     #    Abc[a]<< 
                         #     else
                         #suffixes[a]<<index+1
                      #        end
                     return  k 

                     end
                    }
                    return nil
                  #  y=Hash[suffixes.sort]
                 #   p y
    
  end #of find_suffix

  def find_affix(aff)
    
    a=Array.new
      aff.each{|e| 
        b=find_suffix(e,Affix_Formula)
      if b
        a.push(b)
      else break
      end}
        #print "Position is "
         #     p i+1
      
         return a
        
  end
 
   
 def find_suffix_main(temp=[])
   
   #x=temp
   Affix.each{|e| temp.each{|x| e.match(/#{x}\z/i)#e.match(/#{x}\z/i)
     if $&
       #puts "Found Suffix"
       #p $&
       return e
     end}}
     
 
end
=begin
   suffixes=Affix_Formula
    suffixes.each{|k,v| self.each{|elem| elem(1).match(/#{v}\z/i)}
      if $&
        puts "Suffix match is "
        puts k
        return k
      end}
=end
  
def find_multiplier
  find_suffix(Multipliers)
end# of find_multiplier


    def find_position(suff, h={})
  h.each{|k,v| suff.match(/#{k}\z/i)
    if $&
    return v
    end}
    
  
=begin 
     # regular expression definition
      all_pos=/((?>\d|-|,|\s)*\d+)(?>\s|-)*\z/
      single_pos=/^(?>\s|-|,)*(\d+)/
  
      # match for position at the end of the chemical_name

      if pos= match(all_pos)
        ret=[$`]
        pos[1].match(single_pos)
      end
  
      #if positions found, loop to extract each integer
      while $1
        n=$'
        ret<<$1.to_i
        n.match(single_pos)
      end
      # return the array, if ret is nil (no match) return [self]
      ret || [self]
=end
   
end # of find position

def find_group
  
      # regular expression definition
      #all_pos=/((?>\d|-|,|\s)*\d+)(?>\s|-)*([^0-9]*)\z/
      #single_pos=/^(?>\s|-|,)*(\d+)/
      extract=/(?<=\d|\s|,|-)((?>(\w+|\s)))\z/
      
      # match for position at the end of the chemical_name
      if pos=self.match(extract)
        ret=[$`,$1,$2]
        #pos[1].match(single_pos)
      end
  
      #if positions found, loop to extract each integer
      #while $1
       # n=$'
        #ret<<$1.to_i
        #n.match(single_pos)
      #end
      # return the array, if ret is nil (no match) return [self]
      ret || [self]
   
end # of find position

def find_bond(temp)
  a=Array.new
        temp.each{|e| 
          b=find_suffix(e,Repr)
       if b
         a.push(b)
       else
       return ["ane"] end}
          #print "Position is "
           #     p i+1
        
           return a
end

def extra_pos
  single_pos=/((?>-|\s|,))\z/
  if pos=self.match(single_pos)
    ret=[$`,$1,$2]
end
end

def find_parent
  x= self.each {|elem| elem=~Reg_bracket}.length 
    p x
    #length_rev = Hash[Length.to_a.reverse]

  Length.each{|k,v| x.to_s.match(/#{v}\z/i)
               if $&
                # print "Found match "
                 #print $&
              return k
  end}
  nil
end #find_parent

def find_rep(bond_hash={})
bond_hash.keys.each{|k| bond_hash[Repr[k]]=bond_hash.delete(k) if Repr[k]}
bond_hash.each {|k,v| puts k}
end

end # of class Name_iupac
 
