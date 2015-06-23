
module Iupac_converter
  Alcane_test_name = [  "1,2,3-tribromopropane",   "2-methylbut-3-yn-2-ol",  "3-iodo phenyl butylamine", "silatetradecane",
    # "Trimethyl acetate",
  ]

  Alcohol_test_name = ["ethanol", "ethan-1-ol", "ethan-1,2-diol","ethane-1, 2-diol", "propanol", "propan-2-ol", "pentane-2,3,3-triol"]

  Ultimate_braket_name =[  "4-(1,1-dimethylethyl)-5-ethylnonane","3-ethyl-4,8-dimethylnonan", "7-ethyl-2,6-dimethylnonane",
    #"1-[1-(2-{5-[(4'-cyanobipent-2-yl)oxy]pentyl}oxy)carbonyl] ethane",
  ]
  Sec_fg_name = ["2-oxo-3-hydroxybutanoic acid", "2,4 dicyanopentanoic acid", " 2-hydroxypropane-1,2,3-tricarboxylic acid",
    "18-bromo-12-butyl-11-chloro-4,8-diethyl-5-hydroxy-15-methoxytricosan-3,9-dione",

  ]
  Bracket =[
    "10-bromo-5-(2-hydroxyhept-2-yne) dodeca-3,9,7-tricarboxylic acid",
    "10-bromo-5-hydroxytetracosa-3,9,12-tricarboxylic acid",
  ]

  def test_iupac
    puts "Testing starts"
    # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names

    [
      Alcane_test_name,
      #sec_fg_name,
      #Alcohol_test_name,
      #Ultimate_braket_name,
      #Bracket,
    ].each{|s| s.each{|n|
        #Name_iupac.new(n).to_ruby
        Name_iupac.new(n).to_smiles
        #Name_iupac.new(n).outputs
      }
    }

    puts "Testing ends"
  end #of test_iupac

  def my_test
    puts "testing starts"
    # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names

    [
      Alcane_test_name,
      Sec_fg_name,
      Alcohol_test_name,
      Ultimate_braket_name,
      Bracket
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

    option= {:fg=> [:alkohol], :max_length =>12, :max_multipl => [4], :count => 10 }.merge(option)

  end
end

