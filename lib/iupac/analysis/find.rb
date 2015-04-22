
  
  class Name_iupac  < String
 
  
  def find_suffix(suf=nil)
    
    if !suf
      suffix = Suffix
    elsif suf.is_a?(String)
      suffix=[suf]
  else 
    suffix=suf
    end
    
     suffix.each{|s| self.match(/#{s}\s*\z/)
                     if $& 
                       print "suffix is "
                       puts $&
                       print "left is "
                       puts $`
                       
                      return  [ $`, s, $'] 

                     end
                    }
      return nil
    
     
  
    
  end #of find_suffix

  def find_affix
   find_suffix(Affix)
  end
    
def find_multiplier
  find_suffix(Multipliers)
end# of find_multiplier


def find_position
  
      # regular expression definition
      all_pos=/((?>\d|-|,|\s)*\d+)(?>\s|-)*\z/
      single_pos=/^(?>\s|-|,)*(\d+)/
  
      # match for position at the end of the chemical_name
      if pos=self.match(all_pos)
        print "Position is "
        puts $&
        print "Left is "
        puts $`
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
   
end # of find position

def find_parent
  
  Length.each{|k,v| self.match(/#{k}\s*\z/i)
               if $&
                 print "PARENT is "
                 puts $&
               return [$`,v]
  
               end}
  nil
end #find_parent

end # of class Name_iupac
 
