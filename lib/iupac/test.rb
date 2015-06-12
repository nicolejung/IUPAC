

def test_iupac
  puts "testing starts" 
  # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names

test_chem=[[[:C, "OH"], [:C, "Cl"]]]
  complicated_test_name=[[[:C, "OH"], [:C, "OH", "="], [:C, "C(O)O"], [:C, "Cl"]] ]#, [[:C], [:C], [:C, "=O"], [:C], [:C, "OH"], [:C], [:C], [:C], [:C, "=O"], [:C], [:C, "Cl"], [:C], [:C], [:C], [:C, "OH"], [:C], [:C], [:C, "Br"], [:C], [:C], [:C], [:C], [:C]]]
  
 [ test_chem, complicated_test_name ].each{|s| s.each{|n|  
                       Name_iupac.new(n).to_ruby
                       
                       }
}
    #

   puts "testing ends"
 end #of test_iupac

def my_test
    puts "testing starts" 
    # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names
     
          
  [
    #Alcane_test_name,
    #Sec_fg_name,
    #Alcohol_test_name,
    Bracket,
    Ultimate_braket_name,
    #Bracket
    ].each{|s| s.each{|n|  
                         temp=Name_iupac.new(n)
                         #temp.xyz
                         temp.find_block.to_s 
                         }
  }
      #
     puts "testing ends"
   end #of my_test


def random_generator_iupac_name(option={})
  if !option.is_a?(Hash) 
    option={}
  end

  option= {:fg=> [:alcohol], :max_length =>12, :max_multipl => [4], :count => 10 }.merge(option)
   
end