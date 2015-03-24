

class Chemical_name< String    #Chemical_name derived from class String

  def find_position

      # regular expression definition
    all_pos=/((?>\d|-|,|\s)*\d+)(?>\s|-)*\z/
    single_pos=/^(?>\s|-|,)*(\d+)/

    # match for position at the end of the chemical_name
    if pos=self.match(all_pos)
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
  end

end


a= Chemical_name.new("octa-1,2-ol")
a.find_position

Suffix=
{
    :alkane => "ane",
    :alcohol => "ol",
    :carboxy_acid => "oic acid",
    :aldehyde => "al",
    :ketones=> "one",
    :amines=> "amine",
    :ethers=> "ether",
    :alkene=> "ene",
    :alkyne=> "yne",

}

#this would search the whole strings of compound and search the 

Suffix.each_pair do |k,v|
  a=~/#{v}/
  puts "The given compound is an #{k}" if $&
end


end
