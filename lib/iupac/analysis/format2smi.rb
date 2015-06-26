module Iupac_converter
  class Name_ruby  < Array
    def format2smi
      # return a Smiles compliant chemical name as a string
      F_log[:before, :format2_smi,self]
      map do |element|
        format_step(element)
      end.flatten.join('')

    end # format2smi

    protected

    def format_step(e)
      e.map.with_index do |x,i|
        if x.is_a?(Array)
          #x="("+x[1]+")"
          ["(",format_step(x), ")" ]
        else
          if i == 0
            x.to_s
          else
            "("+x.to_s+")"
          end
        end
      end
    end

  end #class Name_ruby

end #module Iupac_converter