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
  
  
  ## [ functional_group symbol                ,   iupac  prefix /affix                  , iupac suffix           , smiles    ]
                                                                                                                                 
 Functional_groups = [                                                                                                                         
 
   #  1  Radicals                                                                                                                       
         [ :Alkynes                                     ,   "yn"                         ,   "ylidyne"                    ,     ""      ]     ,  
         [ :Alkenes                                     ,   "en"                         ,   "ylidene"                    ,     ""      ]     ,
         [ :Alkanes                                     ,   "ylo"                        ,   "yl"                         ,     ""      ]     ,  
    
   
   #  5   Acids (in the order COOH, C(O)O2H; then their S and Se derivatives followed by sulfonic, sulfinic, selenonic, etc., phosphonic, arsonic, etc., acids)
        [ :Carboxylic_acid                             ,   "carboxy"                     ,   "carboxylic acid"        ,     "C(=O)O"     ]     ,
        [ :Carboxylic_acids                            ,   "carboxy"                     ,   "oic acid"               ,     "(=O)O"      ]     ,
        [ :Carbothioic_S_acids                         ,   "sulfanylcarbonyl"            ,   "thioic S-acid"          ,     "(O)S"      ]     ,
        [ :Carboselenoic_Se_acids                      ,   "selanylcarbonyl"             ,   "selenoic Se-acid"       ,     "COSe"      ]     ,
        [ :Sulfonic_acids                              ,   "sulfo"                       ,   "sulfonic acid"          ,     "S(=O)O"      ]     ,
        [ :Sulfinic_acids                              ,   "sulfino"                     ,   "sulfinic acid"          ,     "SO(O)"      ]     ,
        [ :Phosphonic_acids                            ,   "phosphonic"                  ,   "phosphonic acid"        ,     "P(=O)(O)O"      ]     , 
   
   #  7   Esters   
        [ :Esters                                      ,   "oxycarbonyl"                 ,   "oate"                   ,     "(COO)"      ]     ,
       
   #  8   Acid halides
        [ :Acyl_halides                                ,   "carbonyl"                    ,   "oyl"                    ,     "CO"      ]     ,
        [ :Acyl_chlorides                              ,   "chlorocarbonyl"              ,   "oyl chloride"           ,     "COCl"      ]     ,
          
        [ :Amides                                      ,   "carbamoyl"                   ,   "amide"                  ,     "CoNH="      ]     ,
        [ :Imides                                      ,   "imido"                       ,   "imide"                  ,     "CON=C"      ]     ,
        [ :Amidines                                    ,   "amidino"                     ,   "amidine"                ,     ""      ]     ,
        [ :Nitriles                                    ,   "cyano"                       ,   "nitrile"                ,     "CN"      ]     ,
        [ :Isocyanides                                 ,   "isocyano"                    ,   "isocyanide"             ,     "NC"      ]     ,
        [ :Aldehydes                                   ,   "formyl"                      ,   "al"                     ,     ""      ]     ,
        [ :Thioaldehydes                               ,   "thioformyl"                  ,   "thial"                  ,     ""      ]     ,
        [ :Ketones                                     ,   "oxo"                         ,   "one"                    ,     "=O"      ]     ,
        [ :Thiones                                     ,   "sulfanylidene"               ,   "thione"                 ,     "=S"      ]     ,
        [ :Selones                                     ,   "selanylidene"                ,   "selone"                 ,     "=Se"      ]     ,
        [ :Tellones                                    ,   "tellanylidene"               ,   "tellone"                ,     "=Te"      ]     ,
   #  15  Alcohols
        [ :Alcohols                                     ,   "hydroxy"                    ,        "ol"               ,     "OH"      ]     ,
        
          
    #  16 Halogens 
        [ :Fluoride                                    ,   "fluoro"                ,   "fluoride"                 ,     ":F"      ]     ,               
        [ :Chloride                                    ,   "chloro"                ,   "chloride"                 ,     ":Cl"     ]     ,  
        [ :Bromide                                      ,   "bromo"                ,   "bromide"                  ,     ":Br"      ]     ,
        [ :Iodide                                       ,   "iodo"                 ,   "iodide"                   ,     ":I"      ]     ,
        
     
   #  17 Aryls 
         [ :Benzene                                     ,   "benz"                ,   "benzene"                 ,     "c1ccccc1"      ]     ,            
         [ :Napthalene                                 ,   "napth"                 ,   " napthalene"             ,       "c1ccc2ccccc2c1" ]     ,
         [ :Phenyl                                     ,   "phenyl"                 ,     nil               ,           "c1ccccc1"   ], 
         [ :Amines                                     ,     "amino"                  ,   "amine"                  ,             "NH"      ]  ,
           
             
   #  18 Special Names 
            [ :Carbonyl                                 ,   "carbonyl"                ,   "carbonyl"                 ,     "C=O"          ] ,            
            [ :Nicotin                                  ,    "nicotin"                ,    "nicotino"                 ,    "cc1=cN=cc=c1" ] ,
            [ :Methacryl                                ,    "methacryl"              ,     ""                        ,    "CC(C)=C"      ],
            [ :Pivalo                                    ,    "pivalo"                 , "pival"                       , "CC(C)(C)C"      ],
            [ :Vinyl                                     ,      "vinyl"                 ,    ""                         ,  "C=C"           ]  ,
            [ :IsoPropenyl                               ,      "propenyl"              ,    ""                          ,  "C(C)=C"  ] ,        
             
           
     # 20 ether      
        [ :Oxy_Oate                                     ,   "oxy"                          ,   "oxy"                   ,     "(O)"      ]     ,
   
        [ :Alkynes                                     ,   "ynyl"                          ,   "yne"                     ,     "#"      ]     ,  
        [ :Alkenes                                     ,   "enyl"                           ,  "ene"                     ,     "="      ]     ,
        [ :Alkanes                                     ,   "yl"                             ,   "ane"                    ,     "C"      ]     ,
            
          
          
    ]
 
   #Functional_groups.each{|fg| }
   Affix =  Array.new(Functional_groups.size){|e| Functional_groups[e][1]} 
   Fg =     Array.new(Functional_groups.size){|e| Functional_groups[e][0]}
   Suffix=  Array.new(Functional_groups.size){|e| Functional_groups[e][2]}  
   Formula = Array.new(Functional_groups.size){|e| Functional_groups[e][3]}
   Fg_suffix=Hash[Fg.zip(Suffix).flatten]
   Affix_Formula=Hash[Affix.zip(Formula)]
   Suffix_Formula=Hash[Suffix.zip(Formula)]                                                                                
   
    Bond=Array.new(2){|e| Functional_groups[-e-2][2]}
    Bond_o=     Array.new(3){|e| Functional_groups[e][1]} 
    Bond.concat(Bond_o)
   
    Fg_suffix_affix=Hash[Fg.zip(Suffix.zip(Affix)).flatten]
    Affix_smiles=Hash[Affix.zip(Formula)]


 
  
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
      
   Repr = {
     "yn"      =>      "#",
     "yne"     =>      "#",
     "en"      =>      "=",
     "ene"     =>      "=",
     
   }

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
     "Undec"          =>    11          ,
     "Dodec"          =>    12          ,
     "Tridec"         =>    13          ,
     "Tetradec"       =>    14          ,
     "Hexadec"        =>    16          ,
     "Heptadec"       =>    17          ,
     "Octadec"        =>    18          ,
     "Dec"            =>    10          ,
     "Eicos"          =>    20          ,
     "Docos"          =>    22          ,
     "Tricos"         =>    23          ,
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
    "quad",
    
    ]
    
end
