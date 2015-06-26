module Iupac_converter
  class Name_iupac  < String
    def find_suffix(suf=nil)

      if !suf
        suffix = Suffix
      elsif suf.is_a?(String)
        suffix=[suf]
      else
        suffix=suf
      end

      suffix.each{|s| match(/#{s}\s*\z/)
        if $&
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
      if pos= match(all_pos)
        if $&
        ret=[$`]
        pos[1].match(single_pos)
      else return nil
       end
      end

      #if positions found, loop to extract each integer
      if $1
      while $1
        n=$'
        a=$1
        a=0 if (a==nil || a==1)  
         ret<<a.to_i
          #ret<<$1.to_i
        n.match(single_pos)
      end
        else return nil
        end 
      # return the array, if ret is nil (no match) return [self]
      
        ret || [self] 
        
        #ret || [self]
    end # of find position

    def find_next_position

      # regular expression definition
      all_pos=/((?>\d|-|,|\s)*\d+)(?>\s|-)*([^0-9]*)\z/
      single_pos=/^(?>\s|-|,)*(\d+)/

      # match for position at the end of the chemical_name
      if pos=self.match(all_pos)
        ret=[$`,$1,$2]
        #pos[1].match(single_pos)
      end

      # return the array, if ret is nil (no match) return [self]
      ret || [self]

    end # of find position

    def find_group

      # regular expression definition
      extract=/(?<=\d|\s|,|-)((?>(\w+|\s)))\z/

      # match for position at the end of the chemical_name
      if pos=self.match(extract)
        ret=[$`,$1,$2]

      end

      ret || [self]

    end # of find position

    def find_bond
      find_suffix(Bond)
    end

    def extra_pos
      single_pos=/((?>-|\s|,))\z/
      if pos=self.match(single_pos)
        ret=[$`,$1,$2]
      end
    end

    def find_parent

      Length.each{|k,v| self.match(/#{k}\s*\z/i)
        if $&
          #print "Parent is "+ $& + " "
          return [$`,v]

        end}
      nil
    end #find_parent

    def find_chain
      Length.each{|k,v| self.match(/#{k}\s*\z/i)
        if $&
          return [$`,v]
        end}
      nil
    end

    def find_replace
      Replacement_comp.each{|k,v| self.match(/#{v}\s*\z/i)
        if $&
          puts "found "+k
          return [$`,k]
        end}
      nil
    end

    def simplecycle
      Simplecyclic.each{|k,v| self.match(/#{v}\s*\z/i)
        if $&
          return [$`,k]
        end}
      nil
    end

    def find_rep(bond_hash={})
      bond_hash.keys.each{|k| bond_hash[Repr[k]]=bond_hash.delete(k) if Repr[k]}
      bond_hash.each {|k,v| puts k}
    end

  end # of class Name_iupac

end # module Iupac_converter
