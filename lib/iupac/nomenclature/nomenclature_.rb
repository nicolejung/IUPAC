module Nomenclature

  ## list of functional group in decreasing order of priority for choosing the suffix (principal functional group), highest priority at the top
  ##http://www.acdlabs.com/iupac/nomenclature/93/r93_326.htm
  #  1  Radicals
  #  2   Anions
  #  3   Cations
  #  4   Zwitterionic compounds
  #  5   Acids (in the order COOH, C(O)O2H; then their S and Se derivatives followed by sulfonic, sulfinic, selenonic, etc., phosphonic, arsonic, etc., acids)
  #  6   Anhydrides
  #  7   Esters
  #  8   Acid halides
  #  9   Amides
  #  10  Hydrazides
  #  11  Imides
  #  12  Nitriles
  #  13  Aldehydes followed by Thioaldehydes, Selenoaldehydes, and Teluroaldehydes
  #  14  Ketones followed by Thioketones, Selenoketones, and Telluroketones
  #  15  Alcohols and Phenols followed by Thiols, Selenols, and Tellurols
  #  16  Hydroperoxides followed by Thiohydroperoxides, Selenohydroperoxides, and Tellurohydroperoxides
  #  17  Amines
  #  18  Imines
  #  19  Hydrazines, Phosphanes, etc.
  #  20  Ethers followed by Sulfides, Selenides, and Tellurides
  #  21  Peroxides followed by Disulfides, Diselenides, and Ditellurides
  
  
  ## [ functional_group symbol                ,   iupac  prefix /affix                  , iupac suffix           , smiles  substitution      ]
                                                                                                                                
Functional_groups = [                                                                                                                     
#  1  Radicals                                                                                                                       
        [ :Alkynes                                     ,   "yn"                         ,   "ylidyne"                    ,     ""      ]     ,  
        [ :Alkenes                                     ,   "en"                         ,   "ylidene"                    ,     ""      ]     ,
        [ :Alkanes                                     ,   "ylo"                        ,   "yl"                         ,     ""      ]     ,  
    #  5   Acids (in the order COOH, C(O)O2H; then their S and Se derivatives followed by sulfonic, sulfinic, selenonic, etc., phosphonic, arsonic, etc., acids)
       [ :Carboxylic_acid                             ,   "carboxy"                     ,   "carboxylic acid"        ,     "C(O)O"  ]   , 
       [ :Carboxylic_acids                            ,   "carboxy"                     ,   "oic acid"               ,     "(O)O"   ]   , 
       [ :Carbothioic_S_acids                         ,   "sulfanylcarbonyl"            ,   "thioic S-acid"          ,     "(O)S"   ]   , 
       [ :Carboselenoic_Se_acids                      ,   "selanylcarbonyl"             ,   "selenoic Se-acid"       ,     ""      ]   ,
       [ :Sulfonic_acids                              ,   "sulfo"                       ,   "sulfonic acid"          ,     ""      ]   ,
       [ :Sulfinic_acids                              ,   "sulfino"                     ,   "sulfinic acid"          ,     ""      ]   ,
  #  7   Esters                                                                                                                        ,
       [ :Esters                                      ,   "oxycarbonyl"                 ,   "oate"                   ,     ""      ]   ,
  #  8   Acid halides                                                                                                                  ,
       [ :Acyl_halides                                ,   "halocarbonyl"                ,   "oyl halide"             ,     ""      ]   ,
       [ :Acyl_chlorides                              ,   "chlorocarbonyl"              ,   "oyl chloride"           ,     ""      ]   ,   
       [ :Amides                                      ,   "carbamoyl"                   ,   "amide"                  ,     ""      ]   ,
       [ :Imides                                      ,   "imido"                       ,   "imide"                  ,     ""      ]   ,
       [ :Amidines                                    ,   "amidino"                     ,   "amidine"                ,     ""      ]   ,
       [ :Nitriles                                    ,   "cyano"                       ,   "nitrile"                ,     ""      ]   ,
       [ :Isocyanides                                 ,   "isocyano"                    ,   "isocyanide"             ,     ""      ]   ,
       [ :Aldehydes                                   ,   "formyl"                      ,   "al"                     ,     ""      ]   ,
       [ :Thioaldehydes                               ,   "thioformyl"                  ,   "thial"                  ,     ""      ]   ,
       [ :Ketones                                     ,   "oxo"                         ,   "one"                    ,     ""      ]   ,
       [ :Thiones                                     ,   "sulfanylidene"               ,   "thione"                 ,     ""      ]   ,
       [ :Selones                                     ,   "selanylidene"                ,   "selone"                 ,     ""      ]   ,
       [ :Tellones                                    ,   "tellanylidene"               ,   "tellone"                ,     ""      ]   ,
       [ :Alcohols                                    ,   "hydroxy"                     ,   "ol"                     ,     "OH"    ]   ,      
       [ :Alkynes                                     ,   "yn"                          ,   "yne"                    ,     ""      ]   ,
       [ :Alkenes                                     ,   "en"                          ,  "ene"                    ,     ""      ]    ,
       [ :Alkanes                                     ,   "an"                          ,   "ane"                    ,     "C"      ]  ,
       [ :Alkanes_                                    ,   "ane"                          ,   "ane"                    ,     "C"      ]       
     ]

  #Functional_groups.each{|fg| }
  Suffix = Array.new(Functional_groups.size){|e| Functional_groups[e][2]}
  Affix =  Array.new(Functional_groups.size){|e| Functional_groups[e][1]} 
  Fg =     Array.new(Functional_groups.size){|e| Functional_groups[e][0]}
  Smiles = Array.new(Functional_groups.size){|e| Functional_groups[e][3]}
  Fg_suffix=Hash[Fg.zip(Suffix).flatten]
  Fg_suffix_affix=Hash[Fg.zip(Suffix.zip(Affix)).flatten]
class Alkanes

def self.suffix
return "an"
end

def suffix
return "an"
end 
   
def self.formula
   return "C"
end  

end #of class Alkanes

class Alcohols
    
    def self.suffix
    return "ol"
    end
    
    def suffix
    return "ol"
    end 
       
    def self.formula
       return "OH"
    end  
    
    end #of class Alcohols

    
    
 Length = {
     
   "Meth"           =>    1           ,
   "Eth"            =>    2           ,
   "Prop"           =>    3           ,
   "But"            =>    4           ,
   "Pent"           =>    5           ,
   "Hex"            =>    6           ,
   "Hept"           =>    7           ,
   "Oct"            =>    8           ,
   "Non"            =>    9           ,
   "Dec"            =>    10          ,
   "Undec"          =>    11          ,
   "Dodec"          =>    12          ,
   "Tridec"         =>    13          ,
   "Tetradec"       =>    14          ,
   "Hexadec"        =>    16          ,
   "Heptadec"       =>    17          ,
   "Octadec"        =>    18          ,
   "Eicos"          =>    20          ,
   "Docos"          =>    22          ,
   
   "Tetracos"       =>    24          ,
   "Hexacos"        =>    26          ,
   "Octacos"        =>    28          ,
   "Triacont"       =>    30          ,
   "Dotriacont"     =>    32          ,
   "Tritriacont"    =>    33          ,
   "Tetratriacont"  =>    34          ,
   "Pentatriacont"  =>    35          ,
   "Tetracont"      =>    40          ,
   
}

Multipliers= [
    "di",
    "tri",
    "tetra",
    ]
    
end
