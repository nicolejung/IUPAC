require_relative 'iupac/version'
require_relative 'iupac/nomenclature.rb'
require_relative 'iupac/analysis.rb'
require_relative 'iupac/name_iupac.rb'
require_relative 'iupac/name_smiles.rb'
require_relative 'iupac/test.rb'



puts "Hello World iupac"

puts "Random iupac testing? [Y/N/C]"
answer=gets
if answer =~/^y/
test_iupac
elsif answer =~/^c/
puts "My customed testing"
my_test
else
  puts "Enter a chemical name"
  answer=gets  
  test_name=Name_iupac.new(answer)
  #test_name.to_ruby
  test_name.to_smiles
  
 
end




