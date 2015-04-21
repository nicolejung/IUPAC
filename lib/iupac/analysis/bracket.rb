#class Sample
#  def Hello
#  end
#  puts "Hello World"
#
#  z=10
#  if z>2
#    puts "z is greater than 2"
#  else
#    if z<=2
#      puts "z is 1"
#    else puts "I can't guess z"
#    end
#
#  end
#end
#
#ob =Sample.new
#ob.Hello
#
#

class Chemical_name < String
  
  
  
Reg_bracket=/([^(){}\[\]]*)([(){}\[\]])/

#Reg_bracket=/\-|\(|\)|\-|\{|\}|\[|\]|\,/

  attr_reader :obrk, :cbrk
  
  
  def count_level_br
  if  @temp 
     @obrk+=1 if @temp[1]=="(" || @temp[1]=="[" ||@temp[1]=="{"  
     @obrk-=1 if  @temp[1]==")" || @temp[1]=="]" ||@temp[1]=="}"
  end
   #puts @obrk.to_s
  end
  
  def find_block
   @obrk=0 
   r=""
   @temp||=["",""]
    split_at_bracket
    r<<@temp[0]<<@temp[1]    
    
         count_level_br
   while @obrk!=0
    
     split_at_bracket(@temp[2])
     r<<@temp[0]<<@temp[1]
     count_level_br
     puts 
     r.to_s.each  
     if @obrk==0
      puts "level 0"
       return r 
     end
   end
   
  end
  
  def split_at_bracket(str=nil)
    if str
      a=str
    else
    a=self 
    end
    a=~Reg_bracket
    if $&
      @temp=[$1,$2,$']
    end
    @temp||=[a,"",""]
  end
  
  def countbracket
    @obrk=0
    @cbrk=0
    a=self
    a.each_char do |i|
      if (i=='(') || (i=='[') ||(i=='{') then   @obrk+=1
      elsif (i==')') ||(i==']') ||(i=='}')  then   @cbrk+=1
        #else continue
      end
    end
  end

end

#all_pos=-/\-|\(|\)|\-|\{|\}|\[|\]|\,/

# "aa(b)(c(ddd)"=~/([^()]*))({())/ ; puts $& ; puts $`



#test= "4,4'-{1-[({5-[(4'-cyanobiphenyl-4-yl)oxy]pentyl}oxy)carbonyl]-2-[(4'-cyanobiphenyl-4-yl)oxy]ethylene}dibenzoic acid"
test= "1-[({5-[(4'-cyanobiphenyl-4-yl)oxy]pentyl}oxy)carbonyl] ethylene"


# match for position at the end of the chemical_name
puts test
#a=gets
#@a=Chemical_name.new(gets.chomp)
t=Chemical_name.new(test)
#a= Chemical_name
#puts @a.to_s


t.countbracket

puts "The open brackets are #{t.obrk}"
puts "The close brackets are #{t.cbrk}"


puts t.find_block.to_s



