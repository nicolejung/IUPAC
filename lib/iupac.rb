require_relative 'iupac/version'
require_relative 'iupac/nomenclature.rb'
require_relative 'iupac/name_iupac.rb'
require_relative 'iupac/name_smiles.rb'
require_relative 'iupac/test.rb'


puts "hello world iupac"

puts "random iupac testing? [y/n]"
answer=gets
if answer =~/^y/
test_iupac
else
  puts "enter a chemical name"
  answer=gets  
  test_name=Name_iupac.new(answer)
  test_name.to_ruby
 
end




