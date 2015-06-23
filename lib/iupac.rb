require_relative 'iupac/version'
require_relative 'iupac/nomenclature.rb'
require_relative 'iupac/analysis.rb'
require_relative 'iupac/name_iupac.rb'
require_relative 'iupac/name_smiles.rb'
require_relative 'iupac/test.rb'




module Iupac
  include Iupac_converter

end


module Iupac_converter
  include Test
  def command_line_app
    puts "Hello World iupac \nChemical name testing format Iupac, Smiles, or Ruby? (or custom test) [I/S/R/C]"
    answer=gets
    if answer =~/^I/i
      test_iupac
    elsif answer =~/^C/i
      puts "My customed testing"
      my_test
      elsif answer =~/^R/i
            puts "ruby format testing"
            test_iupac_2
    else
      puts "Enter a iupac chemical name"
      answer=gets
      test_name=Name_iupac.new(answer)
      test_name.to_ruby
    end
  end
end # module Iupac_converter
