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

    
    #all_pos=/-\(|\)|\{|\}|\[|\]-/
# 
    # 4,4'-{1-[({5-[(4'-cyanobiphenyl-4-yl)oxy]pentyl}oxy)carbonyl]-2-[(4'-cyanobiphenyl-4-yl)oxy]ethylene}dibenzoic acid
    # match for position at the end of the chemical_name
    
#a=gets
a=Chemical_name.new(gets.chomp)

#a= Chemical_name 
puts a.find_position.to_s



