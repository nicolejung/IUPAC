require_relative "../lib/iupac.rb"
require_relative "test_chemical_names.rb"

module Test
  include Iupac_converter
  Name_collection ={}
 ##################################
  Name_collection[:iupac] = [
    #Alcane_test_name,
    #Sec_fg_name,
    Alcohol_test_name,
    #Ultimate_braket_name,
    #Bracket,
  ]
  
  Name_collection[:smiles] = [
    Alcohol_test_name_smiles,
  ]

  Name_collection[:ruby] = [
    Alcohol_test_name_ruby,
    Test_chem,
    #Complicated_test_name,
  ]

  ########################################
  def self.command_line_app
    puts "Hello World iupac
         Chemical name formating
          from    to    enter
          Iupac  -> Ruby         
          Iupac  -> Smiles       2
          Ruby   -> Smiles       3   (Mohit) 
          Ruby   -> Iupac        4   (Sheena)
          Smiles -> Ruby         5   (not implemented)
          Smiles -> Iupac        6   (not implemented)
          other                  c   (not implemented)

         "

    answer=gets
    if answer =~/^([123456])/
      test_iupac($1)
    elsif answer =~/^c/i
      puts "My customed testing"
      my_test
    else
      puts "Enter a iupac chemical name"
      answer=gets
      simple_test_2(answer.strip)

    end

  end #command_line_app
  Message=lambda do|mol,iup, rub,smi| 
       puts  "Analysed: "+mol.inspect+"\niupac: "+iup.inspect+"\nruby: "+rub.inspect+"\nsmiles: "+smi.inspect+"\n"+
    "\n--------------done--------------"   end
  
  
  def self.simple_test_1(mol)
    mol=mol.strip
    #rub=Name_iupac.new(mol).to_ruby
    rub= Iupac_converter::new_molecule(mol, :iupac)
    iup=mol
    smi=""# rub.to_smiles
    Message[mol,iup,rub,smi]
  end # simple_test

  def self.simple_test_2(mol)
    mol=mol.strip
    rub= Iupac_converter::new_molecule(mol, :iupac)
    iup=mol
    smi=rub.to_smiles
    Message[mol,iup,rub,smi]
   end # simple_test
   
  def self.simple_test_3(mol)
        rub= Iupac_converter::new_molecule(mol, :ruby)
        iup=""
        smi=rub.conv2smi.to_smiles
        Message[mol,iup,rub,smi]
end # simple_test

  def self.simple_test_4(mol)
    #rub2iup (Sheena)
    rub= Iupac_converter::new_molecule(mol, :ruby)
    iup=Name_iupac_s.new(mol).to_ruby #"not ready yet"  # rub.conv2iup.to_iupac
    smi="" #rub.conv2smi.to_smiles
    Message[mol,iup,rub,smi]
   end   

  def self.simple_test_5(mol)
    #smi2rub 
    rub= "not ready yet" #Iupac_converter::new_molecule(mol, :smiles)
    iup=""  # rub.conv2iup.to_iupac
    smi=mol.strip
    Message[mol,iup,rub,smi]
  end # simple_test

  def self.simple_test_6(mol)
    #smi2iup 
    rub="not ready yet" # Iupac_converter::new_molecule(mol, :smiles)
    iup="not ready yet"  # rub.conv2iup.to_iupac
     smi=mol.strip
     Message[mol,iup,rub,smi]

   end    
  
  def self.test_iupac(i=1)
    puts "Testing starts"
    # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names
    case i.to_i
    when 1
      Name_collection[:iupac].each{ |s| s.each{ |n| simple_test_1(n)  }}
    when 2
      Name_collection[:iupac].each{ |s| s.each{ |n| simple_test_2(n)  }}
    
      when 3
        Name_collection[:ruby].each{ |s| s.each{ |n| simple_test_3(n)  }}
      when 4
        Name_collection[:ruby].each{ |s| s.each{ |n| simple_test_4(n)  }}    
      when 5
        Name_collection[:smiles].each{ |s| s.each{ |n| simple_test_5(n)  }}
      when 
        Name_collection[:smiles].each{ |s| s.each{ |n| simple_test_6(n)  }}
    end

    puts "Testing ends"
  end #of test_iupac

 
  def random_generator_iupac_name(option={})
    if !option.is_a?(Hash)
      option={}
    end

    option= {:fg=> [:alkohol], :max_length =>12, :max_multipl => [4], :count => 10 }.merge(option)

  end

  def self.test_iupac_2
    puts "testing starts"
    # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names

    
    [ test_chem, complicated_test_name ].each{|s| s.each{|n|
        Name_iupac.new(n).to_ruby

      }
    }
    #

    puts "testing ends"
  end #of test_iupac_2

end # module Test

Test::command_line_app