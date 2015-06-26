require_relative 'iupac/version'
require_relative 'iupac/nomenclature.rb'
require_relative 'iupac/analysis.rb'
require_relative 'iupac/name_iupac.rb'
require_relative 'iupac/name_smiles.rb'
require_relative 'iupac/name_ruby.rb'

module Iupac

  include Iupac_converter

end #module Iupac

module Iupac_converter
  @@log=false
  F_log=lambda do |*ob|
    if @@log
      n=2
      file =  "log"
      #path= __FILE__.to_s.gsub(/iupac.rb/,"")
      if ob!=[nil]
        ofile=File.open(file, 'a+')
        ofile.write (caller(0)[2..n].map{|x| x.match(/(\w+.rb)/); $1+$'}.join("<=")+(" "*50))[0..50]+":::  "+ob.map{|e| e.inspect}.join(" : ")+" \n"
      else
        ofile=File.open(file, 'a+')
        ofile.write "\n\n#{"#"*30}Kia ora!#{"#"*30}\n#{Time.now.to_s}\n initialize #{caller(0)[2..-1]}\n\n"
      end
      ofile.close
    end
    
  end #f_log

  def self.new_molecule(mol,typ=:iupac)
    F_log[nil]
    F_log[mol]
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

