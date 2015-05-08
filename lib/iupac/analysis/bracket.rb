class Name_iupac < String
     
    def xyz(ab=nil)
    def xyz(b=")")
        
  reg1 = /(\([a-z0-9\'\-\[\]\{\}]+\))/ # for parenthesis
  reg1 = /(\([a-z0-9\'\-\[\]\{\}]+\))/  # for parenthesis
   reg2 = /(\[[a-z0-9\'\-\(\)\{\}]+\])/ # for square brackets
   reg3 = /(\{[a-z0-9\'\-\(\)\[\]]+\})/ # for curly braces  
   
  
  case b
  when ")"
  ob = "("
  when "]"
  ob = "["
  when "}"
  ob = "{"
  end
  
  
   reverse.match(/#{b}|#{ob}/)
  r=[$`,$'] 
  
   a=Array.new
   s=self     
        
     
   x = reg1.match(s)
   a << x.to_s
   str = x.to_s.chop.reverse.chop.reverse

      @obrk+=1 if @temp1[1]=="(" || @temp1[1]=="[" ||@temp1[1]=="{"  
      @obrk-=1 if @temp1[1]==")" || @temp1[1]=="]" ||@temp1[1]=="}"
    end
   puts @obrk.to_s
   #puts @obrk.to_s
    #puts @cbrk.to_s
    
   end
# @@ -71,7 +85,7 @@ def split_at_bracket(str=nil)
   @temp1=nil  
   if str
       a=str
    else
  
     a=self
     end
     a=~Reg_bracket
 #@@ -82,9 +96,9 @@ def split_at_bracket(str=nil)
   
     
   end

   
  
  def find_block(str=nil)
  def find_block
    @obrk=0 
    r=""
    @temp1||=["",""]
# @@ -97,11 +111,12 @@ def find_block(str=nil)
       split_at_bracket(@temp1[2])
      r<<@temp1[0]<<@temp1[1]
      count_level_br
    puts r.to_s
   
      if @obrk==0
       #puts "Level 0 has reached"
       #puts "Close brackets are #{@cbrk}"
       return r 
       
       return [r, @temp1[2]]
      end
    end #end
end