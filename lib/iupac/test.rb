


def test_iupac
  puts "testing starts" 
  # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names
   alcane_test_name = ["methane","ethane", "propane"]
   alcohol_test_name = ["ethanol", "ethan-1-ol", "ethan-1,2-diol","ethane-1, 2-diol", "propanol", "propan-2-ol", "pentane-2,3,3-triol"]
     
[alcane_test_name,
  alcohol_test_name ].each{|s| s.each{|n|  
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

  option= {:fg=> [:alkohol], :max_length =>12, :max_multipl => [4], :count => 10 }.merge(option)
  for i in 0..option[:count] do
    
    
  end
    
end # of random_generator