


def test_iupac
  puts "testing starts" 
  # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names


   alcane_test_name = ["methane","ethane", "propane"]
   alcohol_test_name = ["ethanol", "ethan-1-ol", "ethan-1,2-diol","propanol", "propan-2-ol", "pentane-2,3,3-triol"] #"ethane-1,2-diol",
    ultimate_braket_name =[ "4,4'-{1-[({5-[(4'-cyanobiphenyl-4-yl)oxy]pentyl}oxy)carbonyl]-2-[(4'-cyanobiphenyl-4-yl)oxy]ethylene}dihexanoic acid",
        "1-[({5-[(4-cyanobiphenyl-4-yl)oxy]pentyl}oxy)carbonyl]ethane",
        ]
     sec_fg_name = ["2-oxo-3-hydroxybutanoic acid", "2,4 dicyanopentanoic acid", " 2-hydroxypropan-1,2,3-tricarboxylic acid",
       #"18-bromo-12-butyl-11-chloro-4,8-diethyl-5-hydroxy-15-methoxytricosa-6,13-dien-19-yne-3,9-dione",
       ] 
       current_test_name=["18-bromo-12-butyl-11-chloro-4,8-diethyl-5-hydroxy-15-methoxytricosa-6,13-dien-19-yne-3,9-dione"] 
        

  #alcane_test_name,
  #sec_fg_name,
  #alcohol_test_name,
  #ultimate_braket_name,
         #,current_test_name
 [ alcane_test_name,
   sec_fg_name,
   alcohol_test_name,
   ultimate_braket_name, 
   current_test_name
  ].each{|s| s.each{|n|  
                       Name_iupac.new(n).to_ruby
                       
                       }
}
    #

   puts "testing ends"
 end #of test_iupac


def random_generator_iupac_name(option={})
  if !option.is_a?(Hash) 
    option={}
  end

  option= {:fg=> [:alcohol], :max_length =>12, :max_multipl => [4], :count => 10 }.merge(option)
    
    
    
end