
class Name_iupac  < Array

  Reg_bracket=/([^\[\]]*)([\[\]])/
  Abc=Hash.new
def find_suffix(suf,suffix)

  if !suf
    suffix = Affix_Formula
else 
  suffix= suffix
  end

   suffix.each{|k,v| a=suf.match(/(#{v})\z/i)
                   if $&
                   return  k 

                   end
                  }
                  return nil
  
end #of find_suffix

def find_affix(aff)
  
  a=Array.new
    aff.each{|e| 
      b=find_suffix(e,Affix_Formula)
    if b
      a.push(b)
    else break
    end}    
       return a     
end


def find_suffix_main(temp)

 Affix.each_with_index{|e,index| temp.match(/#{e}\z/i)#e.match(/#{x}\z/i)
   if $&
     return index
   end}
   
end


def suffix_name(temp)
  Suffix_Name.each{|k,v| temp.match(/#{v}\z/i)
    if $&
      return k
    end}
  
end

def affix_sort (a={})
  a.sort_by{|k,v| x=find_suffix_main(k)}
  return a
end


def find_multiplier(v=[])
  a=v.count.to_s
  find_suffix(a,Multipliers)
end# of find_multiplier


def find_position(suff, h={})
  h.each{|k,v| suff.match(/#{k}\z/i)
    if $&
      return v
    end}
   
end # of find position

def find_group

    extract=/(?<=\d|\s|,|-)((?>(\w+|\s)))\z/
    
    # match for position at the end of the chemical_name
    if pos=self.match(extract)
      ret=[$`,$1,$2]
      #pos[1].match(single_pos)
    end
    ret || [self]
 
end # of find position

def find_bond(temp)
a=Array.new
      temp.each{|e| 
        b=find_suffix(e,Repr)
     if b
       a.push(b)
       return a
     else
     return ["an"] end}      
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
 

Length.each{|k,v| x.to_s.match(/#{v}\z/i)
             if $&
              
            return k
end}
nil
end #find_parent

def find_rep(bond_hash={})
bond_hash.keys.each{|k| bond_hash[Repr[k]]=bond_hash.delete(k) if Repr[k]}
bond_hash.each {|k,v| puts k}
end

end # of class Name_iupac