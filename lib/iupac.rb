require_relative 'iupac/version'
require_relative 'iupac/nomenclature.rb'
require_relative 'iupac/analysis.rb'
require_relative 'iupac/name_iupac.rb'
require_relative 'iupac/name_smiles.rb'
require_relative 'iupac/name_ruby.rb'
require_relative 'iupac/test.rb'

module Iupac
  include Iupac_converter
  include Iupac_converter::Test

end #module Iupac

module Iupac_converter
  def self.new_molecule(mol,typ=:iupac)

    case typ
    when :iupac
      i=mol.is_a?(String) && Name_iupac.new(mol)
      molecule=i.conv2rub
    when :ruby
      molecule=mol.is_a?(Array) &&Name_ruby.new(mol.to_a)
    when :smiles
      s=mol.is_a?(String) &&Name_smiles.new(mol.to_s)
      molecule=s.conv2rub
    end
    molecule

  end

end # module Iupac_converter
