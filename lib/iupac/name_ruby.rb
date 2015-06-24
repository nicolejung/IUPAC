module Iupac_converter
  class Name_ruby < Array
    include Nomenclature

    attr_reader :to_iupac, :to_smiles
    
    def conv2iupac
      @to_iupac= format2iup
      self
    end

    def conv2smi
      @to_smiles= format2smi
      self
    end

    def input_iupac(iupac)
      @to_iupac=iupac
      self
    end

    def input_smiles(smi)
      @to_smiles=(smi)
      self
    end

   

  end # class Name_iupac
end # module Iupac_converter