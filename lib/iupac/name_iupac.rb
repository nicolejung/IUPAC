#require_relative 'nomenclature.rb'
#require_relative 'name_smiles.rb'
#include Hide_and_seek
include Nomenclature
class Name_iupac < String
   #@left_fragment
   #@rigth_fragment
   #
  def to_ruby
    ###method calling other functions to analyse the input string and store the resutl into some ruby class
    frag=self
    puts "## start analyzing compound: "+ self
   
    s=frag.find_suffix 
    frag=s[0] if s
    suffix=s[1] if s
   
    m=frag.find_multiplier
    frag=m[0]if m
    mult=(m && m[1]) || 1

    p=frag.find_position 
    frag=p[0] if p
    position=p[1..-1] if p

     yne=frag.find_suffix("yn")
    frag=yne[0] if yne
    alkyne=yne[1] if yne

    my=frag.find_multiplier 
    frag=my[0] if my
    multy=(my && my[1]) || 1

py=frag.find_position 
frag=py[0] if py
positiony=py[1..-1] if py    
positiony||=[]  
 
ene=frag.find_suffix("en")
   frag=ene[0] if ene
   alkene=ene[1] if ene

  me=frag.find_multiplier 
  frag=me[0] if me
  multe=(me && me[1]) || 1
    
  pe=frag.find_position 
  frag=pe[0] if pe
  positione=pe[1..-1] if pe    
  positione||=[]  
    
if suffix=="yne"
  multy=mult
  positiony=position
end
if suffix=="ene"
  multe=mult
  positione=position
end
parent=frag.find_parent
    frag=parent[0] if parent
    l=parent[1]  if parent

    secundary_fg=frag
puts "length is %i, suffix is %s position is %s 
           %i alkyne bonds  at positions %s
    %i alkene bonds at positions %s" % [l,suffix,position.to_s,positiony.length,positiony.to_s,positione.length,positione.to_s]

    l||=0

    chemical=Array.new(l,[:C])

    if position
      position.each{|po| chemical[po-1]+=[suffix]}
    end
    #chemical||=["failed"]

    while frag != ""

      pr=frag.find_affix
      break if !pr
      frag=pr[0] if pr
      prefix=pr[1] if pr
      if prefix == "yl"
       nx_pos=frag.find_next_position
       
        #   "+nx_pos.to_s
       if nx_pos
       frag=Name_iupac.new(nx_pos[0..1].join)
       
       
       prefix=nx_pos[2]+prefix
       end
      end
      
      #find multi
      
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
          position.each{|po| chemical[po-1]+=[prefix]}
        end
      end
    end

    puts "Chemical is "+chemical.to_s

    # todo change this

  end # to_ruby

  def to_smiles

    ## return a Name_smiles(String) Object
    #Name_smiles.new(...)

  end #to_iupac

end # of class Name_iupac
