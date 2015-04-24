
class Name_iupac < String
  
  
  
Reg_bracket=/([^(){}\[\]]*)([(){}\[\]])/

  attr_reader :obrk, :cbrk
  
  
  def count_level_br
       @xbrk=0
       @cbrk=0
       a=self
       a.each_char do |i|
            if (i=='(') ||(i=='[')||(i=='{') then    @xbrk+=1
         elsif (i==')') ||(i==']') ||(i=='}')  then   @cbrk+=1
           #else continue
         end
       end
  if  @temp1 
     @obrk+=1 if @temp1[1]=="(" || @temp1[1]=="[" ||@temp1[1]=="{"  
     @obrk-=1 if @temp1[1]==")" || @temp1[1]=="]" ||@temp1[1]=="}"
   end
   puts @obrk.to_s
   #puts @cbrk.to_s
  end
  
def split_at_bracket(str=nil)
    if str
      a=str
    else
    a=self
    end
    a=~Reg_bracket
    if $&
      @temp1=[$1,$2,$']
    end
    @temp1||=[a,"",""]
  end
  
  
  def find_block
   @obrk=0 
   r=""
   @temp1||=["",""]
    split_at_bracket
    r<<@temp1[0]<<@temp1[1]    
    
         count_level_br
   while @obrk!=0
          
      split_at_bracket(@temp1[2])
     r<<@temp1[0]<<@temp1[1]
     count_level_br
    puts r.to_s
     if @obrk==0
      puts "Level 0 has reached"
      #puts "Close brackets are #{@cbrk}"
       return r 
     end
   end
   
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
    puts "The open brackets are #{@obrk}"
    puts "The close brackets are #{@cbrk}"
        if (@obrk != @cbrk)
          puts "The compound is invalid, please enter a valid compound"
          exit (0)
        end 
  end # count bracket

end #class Name_iupacc < String



#test= "4,4'-{1-[({5-[(4'-cyanobiphenyl-4-yl)oxy]pentyl}oxy)carbonyl]-2-[(4'-cyanobiphenyl-4-yl)oxy]ethylene}dibenzoic acid"
#test= "1-[({5-[(4'-cyanobiphenyl-4-yl)oxy]pentyl}oxy)carbonyl] ethylene"


# match for position at the end of the chemical_name
#puts test
#a=gets
#@a=Chemical_name.new(gets.chomp)
#t=Chemical_name.new(test)
#a= Chemical_name
#puts @a.to_s


#t.countbracket



#puts t.find_block.to_s



