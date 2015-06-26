#require_relative 'nomenclature.rb'
#require_relative 'name_smiles.rb'
module Iupac_converter
  class Name_iupac < String
    include Nomenclature
    #Reg_bracket=/([^(){}\[\]]*)([(){}\[\]])/
    def to_ruby
      F_log[:input, self]
      #finding suffix
      frag=self
      s=find_suffix
      frag=s[0] if s
      suffix=s[1] if s
      suffix||=nil

      if s
        m=frag.find_multiplier
        frag=m[0]if m
        mult=(m && m[1]) || 1 if m

        p=frag.find_position
        if p
          frag=p[0] #if p
          position=p[1..-1] #if p
        else
          position = [1]
        end

      end

      #storing bond information in a hash

      bonds=Hash.new
      b=frag.find_bond
      F_log[:bond,b]
      while b
        #finding bond
        # b=frag.find_bond
        #break if !b
        frag=b[0] if b
        bond=b[1] if b
        if b
          # finding bond multiplier
          mb=frag.find_multiplier
          frag=mb[0] if mb
          multb=(mb && mb[1]) || 1

          #finding bond position
          pb=frag.find_position
          if pb
            frag=pb[0] #if pb
            positionb=pb[1..-1] #if p
          else
            positionb||=[1]
          end
          bonds[bond]=positionb
          #finding bond representation
          find_rep(bonds)
          puts "Bond is %s and  Position is %s" % [bond.to_s,positionb.to_s]
        end
        b=frag.find_bond
        F_log[:bond,b]
      end

      x=frag.find_suffix(["ane","an","a"," "])
      frag=x[0] if x

      parent=frag.find_parent
      frag=parent[0] if parent
      l=parent[1]  if parent
      l||=0

      F_log[ "Length is %i, Suffix is %s Position is %s" % [l.to_i,suffix,position.to_s]]

      chemical=Array.new(l)#,[:C])
      chemical.map!{|x| x=[:C]}
      F_log[:chemical,chemical]
      if position && ! suffix.match(/^an|ane/)
        F_log[:position,position]
        position.each do |po| chemical[po-1]+=[Suffix_Formula[suffix]]
          F_log[:chemical,chemical]
        end
      end
      chemical||=["failed"]
      #representation for bonds
      bonds.each_pair do |k,v| v.each do |pos| chemical[pos-1]+=[k]
          F_log[:chemical,chemical]
        end
      end

      prefix=Array.new
      while frag != ""
        #check and loop for brackets
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
              position.each{|po| chemical[po-1]+=[temp]
                F_log[:chemical,chemical]}
            end #if
          end #if
        end #while  #  bracket

        if pr=frag.find_affix
          frag=pr[0] if pr
          prefix=[pr[1]] if pr
          if prefix[0] == "yl"
            if yl_=frag.find_group
              frag=yl_[0]
              yl_group=Name_iupac.new(yl_[1...-1].join)
              prefix=yl_group.to_ruby
              y=frag.extra_pos
              frag=y[0] if y
            end
          else
            prefix=[Affix_Formula[prefix[0]]]
          end # if prefix[0] == "yl"

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
            positionp.each{|po| chemical[po-1]+=[prefix]
              F_log[:chemical,chemical]}
          end
          F_log[ "Prefix is %s and  Position is %s" % [prefix,positionp.to_s]]
        end # if pr

        # replacement nomenclature
        re=frag.find_replace
        break if !re
        frag=re[0] if re
        replace=re[1] if re
        mp=frag.find_multiplier
        frag=mp[0] if mp
        multp=(mp && mp[1]) || 1
        p1=frag.find_position
        frag=p1[0] if p1
        position1= (p1 && p1[1..-1]) || []
        puts replace.inspect+position1.inspect
        if position1 && position1 != []
          position1.each do |po| chemical[po-1][0]=replace
            F_log[:chemical,chemical]
          end
        end
      end # while
      #return nested array
      chemical

    end # to_ruby

    def conv2rub
      Name_ruby.new(self.to_ruby).input_iupac(self).conv2smi
    end

  end # of class Name_iupac

end # module
