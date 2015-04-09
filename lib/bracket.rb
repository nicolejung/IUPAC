class Sample
  def Hello
  end
  puts "Hello World"

  z=10
  if z>2
    puts "z is greater than 2"
  else
    if z<=2
      puts "z is 1"
    else puts "I can't guess z"
    end

  end
end

ob =Sample.new
ob.Hello

class Chemical_name < String
  def find_position

    # regular expression definition
    all_pos=/(((?>\d|-|,|\s)*\d+)(?>\s|-)*\z|(-\(|\)|\{|\}|\[|\]-))/
    single_pos=/^(?>\s|-|,)*(\d+)/
    
    #all_pos=/-\(|\)|\{|\}|\[|\]-/

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

#a=gets
a=Chemical_name.new(gets.chomp)

#a= Chemical_name 
puts a.find_position.to_s



