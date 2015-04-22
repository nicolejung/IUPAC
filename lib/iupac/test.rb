    

Alcane_test_name = ["methane","ethane", "propane"]
Alcohol_test_name = ["ethanol", "ethan-1-ol", "ethan-1,2-diol","ethane-1, 2-diol", "propanol", "propan-2-ol", "pentane-2,3,3-triol"]
Ultimate_braket_name =[ "4,4'-{1-[({5-[(4'-cyanobiphenyl-4-yl)oxy]pentyl}oxy)carbonyl]-2-[(4'-cyanobiphenyl-4-yl)oxy]ethylene}dihexanoic acid",
                        "1-[({5-[(4'-cyanobiphenyl-4-yl)oxy]pentyl}oxy)carbonyl] ethane",
                       ]
 Sec_fg_name = ["2-oxo-3-hydroxybutanoic acid", "2,4 dicyanopentanoic acid", " 2-hydroxypropane-1,2,3-tricarboxylic acid",
                "18-bromo-12-butyl-11-chloro-4,8-diethyl-5-hydroxy-15-methoxytricosan-3,9-dione",
                ] 


def test_iupac
  puts "testing starts" 
  # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names
       
    [
     #Alcane_test_name,
      Sec_fg_name,
      Alcohol_test_name,
      #Ultimate_braket_name,
       ].each{|s| s.each{|n|  Name_iupac.new(n).to_ruby }}
    
   puts "testing ends"
  end #of test_iupac
   
def my_test
    puts "testing starts" 
    # this method, 
     
          
  [
    #Alcane_test_name,
    #Sec_fg_name,
    #Alcohol_test_name,
    Ultimate_braket_name,
    ].each do |s| s.each do |n|  
                         temp=Name_iupac.new(n)
                         temp.countbracket
                         temp.find_block.to_s 
    end
  end
      #
     puts "my testing ends"
   end #of my_test



def random_generator_iupac_name(option={})
  if !option.is_a?(Hash) 
    option={}
  end

  option= {:fg=> [:alkohol], :max_length =>12, :max_multipl => [4], :count => 10 }.merge(option)
    
    
end