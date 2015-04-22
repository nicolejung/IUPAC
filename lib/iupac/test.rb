


def test_iupac
  puts "testing starts" 
  # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names
   alcane_test_name  = ["propane"]
   alkene_test_name  = ["prop-2-ene","but-2-yne"] #"but-2,3-dien-1-ol"]
   alcohol_test_name = ["eth-1-ol", "ethan-1-ol", "ethan-1,2-diol","but-3-en-2-ol"]# "propanol", "propan-2-ol", "pentane-2,3,3-triol"]
  func_test_name = ["2,8-dimethyl-4-ethyl-decane"]
     [#alcane_test_name, 
       alkene_test_name#, alcohol_test_name,func_test_name
       ].each{|s| s.each{|n|  Name_iupac.new(n).to_ruby} }
    
   puts "testing ends"
 end #of test_iupac


def random_generator_iupac_name(option={})
  if !option.is_a?(Hash) 
    option={}
  end

  option= {:fg=> [:alcohol], :max_length =>12, :max_multipl => [4], :count => 10 }.merge(option)
    
    
    
end