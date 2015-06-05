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

        puts "Secondary chain is %s and position is" % [chain, position1.to_s]
     
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
    chemical=Array.new(l,[:C])
    
      frag.to_ruby
      puts "Chemical is" + chemical.to_s
    
    
  end #outputs

end # of class Name_iupac