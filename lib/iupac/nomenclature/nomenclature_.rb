module Nomenclature

  ## list of functional group in decreasing order of priority for choosing the suffix (principal functional group), highest priority at the top
  ##http://www.acdlabs.com/iupac/nomenclature/93/r93_326.htm
  #  1   Radicals
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

    #  2  Anions
    #[:nil, nil, nil  ,nil   ],
      
    #  3  Cation

    #  4  Zwitterionic compounds

    #  5   Acids (in the order COOH, C(O)O2H; then their S and Se derivatives followed by sulfonic, sulfinic, selenonic, etc., phosphonic, arsonic, etc., acids)
    [ :Carboxylic_acid                             ,   "carboxy"                     ,   "carboxylic acid"        ,     "C(=O)O"     ]     ,
    [ :Carboxylic_acids                            ,   "carboxy"                     ,   "oic acid"               ,     "(=O)O"      ]     ,
    [ :Carbothioic_S_acids                         ,   "sulfanylcarbonyl"            ,   "thioic S-acid"          ,     "(O)S"      ]     ,
    [ :Carboselenoic_Se_acids                      ,   "selanylcarbonyl"             ,   "selenoic Se-acid"       ,     "COSe"      ]     ,
    [ :Sulfonic_acids                              ,   "sulfo"                       ,   "sulfonic acid"          ,     "S(=O)O"      ]     ,
    [ :Sulfinic_acids                              ,   "sulfino"                     ,   "sulfinic acid"          ,     "SO(O)"      ]     ,
    [ :Phosphonic_acids                            ,   "phosphonic"                  ,   "phosphonic acid"        ,     "P(=O)(O)O"      ]     ,

    #  6 Anhydrides

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

    #   9   Amides

    #   10  Hydrazides

    #   11  Imides

    #   12  Nirtiles

    #   13  Aldehydes

    #   14  Ketons

    #   15  Alcohols
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
  
Replacement_comp = {
 
  "F"    =>  "fluora"  ,   "W"   =>    "tungsta" ,
  "Cl"   =>  "chlora"  ,   "V"   =>   "vanada"   ,
  "Br"   =>  "broma"   ,   "Nb"  =>    "nioba"   ,
  "I"    =>  "ioda"    ,   "Ta"  =>    "tantala" ,
  "At"   =>  "astata"  ,   "Ti"  =>   "titana"   ,
  "O"    =>  "oxa"     ,   "Zr"  =>   "zircona"  ,
  "S"    =>  "thia"    ,   "Hf"  =>   "hafna"  ,
  "Se"   =>  "selena"  ,   "Sc"  =>   "scanda"  ,
  "Te"   =>  "tellura" ,   "Y"   =>   "yttra"  ,
  "Po"   =>  "polona"  ,   "La"  =>   "lanthana"  ,
  "N"    =>  "aza"     ,   "Ce"  =>   "cera"  ,
  "P"    =>  "phospha" ,   "Pr"  =>   "praseodyma"  ,
  "As"   =>  "arsa  "  ,   "Nd"  =>   "neodyma"  ,
  "Sb"   =>  "stiba"   ,   "Pm"  =>   "prometha"  ,
  "Bi"   =>  "bisma"   ,   "Sm"  =>   "samara"  ,
  "C"    =>  "carba"   ,   "Eu"  =>   "europa"  ,
  "Si"   =>  "sila"    ,   "Gd"  =>   "gadolina"  ,
  "Ge"   =>  "germa"   ,   "Tb"  =>   "terba"  ,
  "Sn"   =>  "stanna"  ,   "Dy"  =>  "dysprosa"  ,
  "Pb"   =>  "plumba"  ,   "Ho"  =>   "holma"  ,
  "B"    =>  "bora"    ,   "Er"  =>   "erba"   ,
  "Al"   =>  "alumina" ,   "Tm"  =>   "thula"  ,
  "Ga"   =>  "galla"   ,   "Yb"  =>   "ytterba"  ,
  "In"   =>  "inda"    ,   "Lu"  =>   "luteta"  ,
  "Tl"   =>  "thalla"  ,   "Ac"  =>   "actina"  ,
  "Zn"   =>  "zinca"   ,   "Th"  =>   "thora"  ,
  "Cd"   =>  "cadma"   ,   "Pa"  =>   "protactina"  ,
  "Hg"   =>  "mercura" ,   "U"   =>   "urana"  ,
  "Cu"   =>  "cupra"   ,   "Np"  =>   "neptuna"  ,
  "Ag"   =>  "argenta" ,   "Pu"  =>   "plutona"  ,
  "Au"   =>  "aura"    ,   "Am"  =>   "america"  ,
  "Ni"   =>  "nickela" ,   "Cm"  =>   "cura"  ,
  "Pd"   =>  "pallada" ,   "Bk"  =>   "berkela"  ,
  "Pt"   =>  "platina" ,   "Cf"  =>   "californa"  ,
  "Co"   =>  "cobalta" ,   "Es"  =>   "einsteina"  ,
  "Rh "  =>  "rhoda"   ,   "Fm"  =>   "ferma"  ,
  "Ir"   =>  "irida"   ,   "Md"  =>   "mendeleva"  ,
  "Fe"   =>  "ferra"   ,   "No"  =>   "nobela"  ,
  "Ru"   =>  "ruthena" ,   "Lr"  =>   "lawrenca"  ,
  "Os"   =>  "osma"    ,   "Be"  =>   "berylla"  ,
  "Mn"   =>  "mangana" ,   "Mg"  =>   "magnesa"  ,
  "Tc"   =>  "techneta",  "Ca"  =>   "calca"  ,
  "Re"   =>  "rhena"   ,  "Sr"  =>   "stronta"  ,
  "Cr"   =>  "chroma"  ,  "Ba"  =>   "bara"  ,
  "Mo"   =>  "molybda" ,  "Ra"  =>   "rada"  ,


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
  
=begin

Simplecyclic= {   #they can't have suffixes

      "C/C=C/C1=C(OC)C=C(OC)C(OC)=C1"  => "alpha-asarone",
      "o1cccc1C(=O)C(=O)c2ccco2"=> "alpha-furil",
      "o1cccc1C(=O)C(=O)c2ccco2" => "2,2'-furil",
      "o1cccc1C(=O)C(O)c2ccco2" =>"2,2'-furoin",
      "C[C@@]1([C@H]2[C@@](CCC1)(C)[C@H]3CCC(C(C)C)=CC3=CC2)C(=O)N" =>"abietamide",
      "CC(=O)c1cc(OC)c(O)cc1" => "acetovanillone",
      "OCc1ccc(OC)cc1" => "anise alcohol",
      "c1(ccc(OC)cc1)C(=O)C(=O)c2ccc(OC)cc2" => "anisil",
      "c1(ccc(OC)cc1)C(=O)C(=O)c2ccc(OC)cc2" => "p-anisil",
      "c1(ccc(OC)cc1)C(=O)C(O)c2ccc(OC)cc2" => "anisoin",
      "c1(ccc(OC)cc1)C(=O)C(O)c2ccc(OC)cc2" =>"p-anisoin",
      "c1(=O)c(=O)ccc2cc3ccccc3cc12" labels="1//2//3/4/4a/10/10a/5/6/7/8/8a/9/9a">anthra-1,2-quinone",
      "c1(=O)ccc(=O)c2cc3ccccc3cc12" labels="1//2/3/4//4a/10/10a/5/6/7/8/8a/9/9a">anthra-1,4-quinone",
      "c1cccc2c(=O)c3ccccc3c(=O)c12" labels="1/2/3/4/4a/10//10a/5/6/7/8/8a/9//9a">anthra-9,10-quinone",
      "CC(=O)c1cc(OC)c(O)cc1" labels="///1/2/3///4//5/6">apocynin",
      "N1C(=O)NC(=O)CC(=O)1" labels="1/2//3/4//5/6/" defaultInLocant="5">barbituric",
      "N1C(=O)NC(=O)CC(=O)1" labels="1/2//3/4//5/6/" defaultInLocant="5">barbituricacid",
      "N1C(=O)NC(=O)CC(=O)1" labels="1/2//3/4//5/6/" defaultInLocant="5">barbituric acid",
      "c1(ccccc1)C(=O)C(=O)c2ccccc2" labels="1/2/3/4/5/6/////1'/2'/3'/4'/5'/6'">benzil",
      "c1(=O)c(=O)cccc1" labels="1//2,ortho//3,meta/4,para/5/6">benzo-1,2-quinone",
      "c1(=O)ccc(=O)cc1" labels="1//2,ortho/3,meta/4,para//5/6">benzo-1,4-quinone",
      "c1ccccc1" labels="1/2,ortho/3,meta/4,para/5/6">benzol",
      "c1(ccccc1)C(O)(c2ccccc2)C(O)(c3ccccc3)c4ccccc4" labels="1/2/3/4/5/6///1'/2'/3'/4'/5'/6'///1''/2''/3''/4''/5''/6''/1'''/2'''/3'''/4'''/5'''/6'''">benzopinacol".
      "c1(ccccc1)C(c2ccccc2)(c3ccccc3)C(=O)c4ccccc4">benzopinacolone",
      "c1ccccc1" labels="1/2,ortho/3,meta/4,para/5/6" addGroup="[O|1] locant 1;O locant 4" frontLocantsExpected="1,2,ortho,3,meta,4,para,5,6">benzosemiquinone"
      "Oc1ccc(cc1)C(C)(C)c2ccc(cc2)O">bisphenol a"
      "O=Cc1cc(OCC)c(O)cc1" labels="//1/2/3////4//5/6">bourbonal"
      "c1c(O)c(C)ccc1C(C)C">carvacrol"
      "c1(ccc(CC=C)cc1)O">chavicol"
      "OC/C=C/c1cc(OC)c(O)cc1">coniferol"
      "c1(c(OC)cc(C)cc1)O">creosol"
      "O=Cc1ccc(C(C)C)cc1" labels="//1/2/3/4////5/6">cumaldehyde"
      "OC(=O)c1ccc(C(C)C)cc1" labels="///1/2/3/4////5/6" functionalIDs="1">cuminic acid"
      "OC(=O)c1ccc(C(C)C)cc1" labels="///1/2/3/4////5/6" functionalIDs="1">cuminicacid"
      "OC(=O)c1ccc(C(C)C)cc1" labels="///1/2/3/4////5/6" functionalIDs="1">cumic acid"
      "OC(=O)c1ccc(C(C)C)cc1" labels="///1/2/3/4////5/6" functionalIDs="1">cumicacid"
      "O=Cc1ccc(C(C)C)cc1" labels="//1/2/3/4////5/6">cuminal"
      "O=Cc1ccc(C(C)C)cc1" labels="//1/2/3/4////5/6">cuminaldehyde"
      "OCc1ccc(C(C)C)cc1" labels="//1/2/3/4////5/6">cuminol"
      "COc1cc(ccc1O)\C=C\C(=O)CC(=O)\C=C\c1ccc(O)c(OC)c1">curcumin"
      "n1c(N)nc(N)nc1N" labels="1/2/N/3/4/N'/5/6/N''">cyanuramide"
      "n1c(N)nc(N)nc1N" labels="1/2/N/3/4/N'/5/6/N''">cyanurotriamide"
      "n1c(N)nc(N)nc1N" labels="1/2/N/3/4/N'/5/6/N''">cyanurotriamine"
      "c1ccccc1C(=O)NC(=O)c2ccccc2" functionalIDs="9">dibenzamid"
      "c1ccccc1C(=O)NC(=O)c2ccccc2" functionalIDs="9">dibenzamide"
      "c1(c(C(=O)[O-])cccc1)c2c(C(=O)[O-])cccc2" labels="1/2////3/4/5/6/1'/2'////3'/4'/5'/6'" functionalIDs="5,14">diphenate"
      "c1(c(C(=O)O)cccc1)c2c(C(=O)O)cccc2" labels="1/2////3/4/5/6/1'/2'////3'/4'/5'/6'" functionalIDs="5,14">diphenic"
      "c1(c(C(=O)O)cccc1)c2c(C(=O)O)cccc2" labels="1/2////3/4/5/6/1'/2'////3'/4'/5'/6'" functionalIDs="5,14">diphenicacid"
      "c1(c(C(=O)O)cccc1)c2c(C(=O)O)cccc2" labels="1/2////3/4/5/6/1'/2'////3'/4'/5'/6'" functionalIDs="5,14">diphenic acid"
      "c1(c(C)c(C)c(O)c(C)c1C)O">durohydroquinone"
      "CC(c1ccccc1)=CC(c2ccccc2)=O">dypnone"
      "COc1c(OC)c(OC)cc(CC=C)c1">elemicin"
      "c1(ccc(CC=C)cc1)OC">estragole"
      "O=Cc1cc(OCC)c(O)cc1" labels="//1/2/3////4//5/6">ethyl vanillin"
      "O=Cc1cc(OCC)c(O)cc1" labels="//1/2/3////4//5/6">ethylvanillin"
      "O=CCc1cc(O)c(OC)cc1" labels="///1/2/3//4///5/6">homoisovanillin"
      "O=CCc1cc(OC)c(O)cc1" labels="///1/2/3///4//5/6">homovanillin"
      "O=CCc1c(O)c(OC)ccc1" labels="///1/2//3///4/5/6">o-homovanillin"
      "c1(c(N)cccc1)C(=O)C(=O)O" labels="1/2//3/4/5/6/////" functionalIDs="12">isatic"
      "c1(c(N)cccc1)C(=O)C(=O)O" labels="1/2//3/4/5/6/////" functionalIDs="12">isaticacid"
      "c1(c(N)cccc1)C(=O)C(=O)O" labels="1/2//3/4/5/6/////" functionalIDs="12">isatic acid"
      "c1(C(=O)O)c(NC(=O)O)cccc1" labels="1////2/////3/4/5/6" functionalIDs="4,9">isatoic"
      "c1(C(=O)O)c(NC(=O)O)cccc1" labels="1////2/////3/4/5/6" functionalIDs="4,9">isatoicacid"
      "c1(C(=O)O)c(NC(=O)O)cccc1" labels="1////2/////3/4/5/6" functionalIDs="4,9">isatoic acid"
      "COc1c(OC)c(OC)cc(C=CC)c1">isoelemicin"
      "c1(c(O)ccc(C=CC)c1)OC" labels="1/2,ortho//3,meta/4,para/5////6//alpha">isoeugenol"
      "OCc1cc(CO)ccc1" labels="//1/2,ortho/3,meta///4,para/5/6">isophthalyl alcohol"
      "O=Cc1cc(O)c(OC)cc1" labels="//1/2/3//4///5/6">isovanillin"
      "n1c(N)nc(N)nc1N" labels="1/2/N/3/4/N'/5/6/N''">melamine"
      "c1(O)ccc(O)cc1" labels="1//2,ortho/3,meta/4,para//5/6">quinol"
      "c12cc3cc4c1.C2(=O)O.C3.C4" labels="1/2,ortho/3,meta/4,para/5/6/////" functionalIDs="9">mesitylenate"
      "c12cc3cc4c1.C2(=O)O.C3.C4" labels="1/2,ortho/3,meta/4,para/5/6/////" functionalIDs="9">mesitylenic"
      "c12cc3cc4c1.C2(=O)O.C3.C4" labels="1/2,ortho/3,meta/4,para/5/6/////" functionalIDs="9">mesitylenic acid"
      "c12cc3cc4c1.C2(=O)O.C3.C4" labels="1/2,ortho/3,meta/4,para/5/6/////" functionalIDs="9">mesitylenicacid"
      "c1(=O)c(=O)ccc2ccccc12" labels="1//2//3/4/4a/5/6/7/8/8a">naphtho-1,2-quinone"
      "c1(=O)ccc(=O)c2ccccc12" labels="1//2/3/4//4a/5/6/7/8/8a">naphtho-1,4-quinone"
      "n1cccc(c1)C2N(C)CCC2">nicotine"<!--not to be confused with nicotinic acid-->
      "c1(cc(O)cc(CCCCC)c1)O">olivetol"
      "c1(cc(O)cc(C)c1)O">orcinol"
      "c1ccccc1C(=O)O[O-]" labels="2,ortho/3,meta/4,para/5/6/1////" functionalIDs="10">perbenzoate"
      "c1ccccc1C(=O)OO" labels="2,ortho/3,meta/4,para/5/6/1////" functionalIDs="10">perbenzoic"
      "c1ccccc1C(=O)OO" labels="2,ortho/3,meta/4,para/5/6/1////" functionalIDs="10">perbenzoicacid"
      "c1ccccc1C(=O)OO" labels="2,ortho/3,meta/4,para/5/6/1////" functionalIDs="10">perbenzoic acid"
      "OCc1c(CO)cccc1" labels="//1/2,ortho///3,meta/4,para/5/6">phthalyl alcohol"
      "c1(ccccc1)O" labels="1/2,ortho/3,meta/4,para/5/6/">phenol"
      "c1(ccccc1)[O-]" labels="1/2,ortho/3,meta/4,para/5/6/">phenolate"
      "[c+]1(ccccc1)" labels="1/2,ortho/3,meta/4,para/5/6">phenylium"
      "Oc1ccc(CCC(=O)c2c(O)cc(O)cc2O)cc1">phloretin"
      "c1(c(CC)cccc1)O">phlorol"
      "c1([N+](=O)[O-])cc([N+](=O)[O-])cc([N+](=O)[O-])c1[O-]" labels="2,ortho////3,meta/4,para////5/6////1/" functionalIDs="16">picrate"
      "c1([N+](=O)[O-])cc([N+](=O)[O-])cc([N+](=O)[O-])c1O" labels="2,ortho////3,meta/4,para////5/6////1/" functionalIDs="16">picric"
      "c1([N+](=O)[O-])cc([N+](=O)[O-])cc([N+](=O)[O-])c1O" labels="2,ortho////3,meta/4,para////5/6////1/" functionalIDs="16">picricacid"
      "c1([N+](=O)[O-])cc([N+](=O)[O-])cc([N+](=O)[O-])c1O" labels="2,ortho////3,meta/4,para////5/6////1/" functionalIDs="16">picric acid"
      "c1(c(C)c(C)c(O)c(C)c1)O">pseudocumohydroquinone"
      "n1c(N)[nH]c(=O)c2nccnc12" labels="1/2//3/4//4a/5/6/7/8/8a">pterin"
      "n1c(N)[nH]c(=O)c2ncCNc12" labels="1/2//3/4//4a/5/6/7/8/8a">dihydropterin"
      "n1c(N)[nH]c(=O)c2NCCNc12" labels="1/2//3/4//4a/5/6/7/8/8a">tetrahydropterin"
      "n1c(C(=O)O)c(C(=O)O)ccc1" labels="1/2,ortho////3,meta////4,para/5/6" functionalIDs="5,9">quinolinic"
      "n1c(C(=O)O)c(C(=O)O)ccc1" labels="1/2,ortho////3,meta////4,para/5/6" functionalIDs="5,9">quinolinicacid"
      "n1c(C(=O)O)c(C(=O)O)ccc1" labels="1/2,ortho////3,meta////4,para/5/6" functionalIDs="5,9">quinolinic acid"
      "n1c2c(=O)[nH]c(N)nc2nc(C)c1[C@@H](C)Nc1ccc(C[C@@H]([C@@H]([C@@H](CO[C@H]2O[C@H](COP(O[C@@H](CCC(O)=O)C(O)=O)(O)=O)[C@H]([C@H]2O)O)O)O)O)cc1" labels="5/4a/4//3/2//1/8a/8/7//6////////////////////////////////////////">methanopterin"
      "N1c2c(=O)[nH]c(N)nc2N[C@@H](C)C1[C@@H](C)Nc1ccc(C[C@@H]([C@@H]([C@@H](CO[C@H]2O[C@H](COP(O[C@@H](CCC(O)=O)C(O)=O)(O)=O)[C@H]([C@H]2O)O)O)O)O)cc1" labels="5/4a/4//3/2//1/8a/8/7//6////////////////////////////////////////">tetrahydromethanopterin"
      "N1c2c(=O)[nH]c(N)nc2N[C@@H](C)C1[C@@H](C)Nc1ccc(C[C@@H]([C@@H]([C@@H](CO[C@H]2O[C@H](COP(O[C@@H](CCC(O)=O)C(O)=O)(O)=O)[C@H]([C@H]2O)O)O)O)O)cc1" labels="5/4a/4//3/2//1/8a/8/7//6////////////////////////////////////////">5,6,7,8-tetrahydromethanopterin"
      "c1(cc(O)cc(O)c1)C=Cc2ccc(O)cc2" labels="1/2/3//4/5//6/alpha/beta/1'/2'/3'/4'//5'/6'">resveratrol"
      "c1(O)cc(O)ccc1" labels="1//2,ortho/3,meta//4,para/5/6">resorcin"
      "c1(cc(O)cc(O)c1)C=Cc2cc(O)c(OC)cc2" labels="1/2/3//4/5//6/alpha/beta/1'/2'/3'//4'///5'/6'">rhapontigenin"
      "OCc1ccccc1O">saligenin"
      "CC/C(c1ccc(O)cc1)=C(c2ccc(O)cc2)/CC">diethylstilbestrol"
      "c1([N+](=O)[O-])c([O-])c([N+](=O)[O-])cc([N+](=O)[O-])c1[O-]" labels="2,ortho////3,meta//4,para////5/6////1/" functionalIDs="6,17">styphnate"
      "c1([N+](=O)[O-])c(O)c([N+](=O)[O-])cc([N+](=O)[O-])c1O" labels="2,ortho////3,meta//4,para////5/6////1/" functionalIDs="6,17">styphnic"
      "c1([N+](=O)[O-])c(O)c([N+](=O)[O-])cc([N+](=O)[O-])c1O" labels="2,ortho////3,meta//4,para////5/6////1/" functionalIDs="6,17">styphnicacid"
      "c1([N+](=O)[O-])c(O)c([N+](=O)[O-])cc([N+](=O)[O-])c1O" labels="2,ortho////3,meta//4,para////5/6////1/" functionalIDs="6,17">styphnic acid"
      "C=Cc1ccccc1" labels="alpha/beta/1/2,ortho/3,meta/4,para/5/6">styrol"
      "O1[N-][NH+]=CC1(=O)" labels="1/2/3/4/5/">sydnone"
      "OCc1ccc(CO)cc1" labels="//1/2,ortho/3,meta/4,para///5/6">terephthalyl alcohol"
      "c1(c(C(C)C)cc(O)c(C)c1)O">thymohydroquinone"
      "c1c(C)ccc(C(C)C)c1O">thymol"
      "c1(c(C)cc(O)cc1)O">toluhydroquinone"
      "c1(ccccc1)C" labels="1/2,ortho/3,meta/4,para/5/6/alpha">toluol"
      "c1ccccc1C(=O)N(C(=O)c2ccccc2)C(=O)c3ccccc3">tribenzamid"
      "c1ccccc1C(=O)N(C(=O)c2ccccc2)C(=O)c3ccccc3">tribenzamide"
      "[nH]1c(=O)[nH]c2[nH]c(=O)[nH]c2c1=O" labels="1/2//3/4/9/8//7/5/6/">uric"
      "[nH]1c(=O)[nH]c2[nH]c(=O)[nH]c2c1=O" labels="1/2//3/4/9/8//7/5/6/">uricacid"
      "[nH]1c(=O)[nH]c2[nH]c(=O)[nH]c2c1=O" labels="1/2//3/4/9/8//7/5/6/">uric acid"
      "O=Cc1cc(OC)c(O)cc1" labels="//1/2/3///4//5/6">vanillin"
      "O=Cc1c(O)c(OC)ccc1" labels="//1/2//3///4/5/6">o-vanillin"
      "c1ccccc1" labels="1/2,ortho/3,meta/4,para/5/6" addGroup="C defaultLocant 1 alpha;C defaultLocant 2 alpha'" frontLocantsExpected="1,2,ortho,3,meta,4,para,5,6">xylol"
      "c1(c(C)c(C)c(O)cc1)O">o-xylohydroquinone"
      "c1(c(C)c(C)c(O)cc1)O">ortho-xylohydroquinone"
      "c1(c(C)cc(O)cc1C)O">m-xylohydroquinone"
      "c1(c(C)cc(O)cc1C)O">meta-xylohydroquinone"
      "c1(c(C)cc(O)c(C)c1)O">p-xylohydroquinone"
      "c1(c(C)cc(O)c(C)c1)O">para-xylohydroquinone"
      "O=C(C)CCc1cc(OC)c(O)cc1">zingerone"
    
  
   
  
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c([nH2])ncnc23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6/N/1/2/3/4" functionalIDs="11,12">5'-adenylic"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c([nH2])ncnc23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6/N/1/2/3/4" functionalIDs="11,12">5'-adenylicacid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c([nH2])ncnc23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6/N/1/2/3/4" functionalIDs="11,12">5'-adenylic acid"
      "[C@@H]1(C[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)[nH]c(=O)c(C)c2" labels="1'/2'/3'//4'/5'///////1/2//3/4//5/alpha/6" functionalIDs="10,11">5'-thymidylic"
      "[C@@H]1(C[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)[nH]c(=O)c(C)c2" labels="1'/2'/3'//4'/5'///////1/2//3/4//5/alpha/6" functionalIDs="10,11">5'-thymidylicacid"
      "[C@@H]1(C[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)[nH]c(=O)c(C)c2" labels="1'/2'/3'//4'/5'///////1/2//3/4//5/alpha/6" functionalIDs="10,11">5'-thymidylic acid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c(=O)[nH]c(N)nc23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6//1/2//3/4" functionalIDs="11,12">5'-guanylic"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c(=O)[nH]c(N)nc23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6//1/2//3/4" functionalIDs="11,12">5'-guanylicacid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c(=O)[nH]c(N)nc23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6//1/2//3/4" functionalIDs="11,12">5'-guanylic acid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c([oH])ncnc23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6//1/2/3/4" functionalIDs="11,12">5'-inosinic"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c([oH])ncnc23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6//1/2/3/4" functionalIDs="11,12">5'-inosinicacid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c([oH])ncnc23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6//1/2/3/4" functionalIDs="11,12">5'-inosinic acid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c(=O)[nH]c(=O)[nH]c23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6//1/2//3/4" functionalIDs="11,12">5'-xanthylic"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c(=O)[nH]c(=O)[nH]c23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6//1/2//3/4" functionalIDs="11,12">5'-xanthylicacid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2cnc3c(=O)[nH]c(=O)[nH]c23" labels="1'/2'//3'//4'/5'///////9/8/7/5/6//1/2//3/4" functionalIDs="11,12">5'-xanthylic acid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)nc([nH2])cc2" labels="1'/2'//3'//4'/5'///////1/2//3/4/N/5/6" functionalIDs="11,12">5'-cytidylic"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)nc([nH2])cc2" labels="1'/2'//3'//4'/5'///////1/2//3/4/N/5/6" functionalIDs="11,12">5'-cytidylicacid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)nc([nH2])cc2" labels="1'/2'//3'//4'/5'///////1/2//3/4/N/5/6" functionalIDs="11,12">5'-cytidylic acid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)[nH]c(=O)cc2" labels="1'/2'//3'//4'/5'///////1/2//3/4//5/6" functionalIDs="11,12">5'-uridylic"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)[nH]c(=O)cc2" labels="1'/2'//3'//4'/5'///////1/2//3/4//5/6" functionalIDs="11,12">5'-uridylicacid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)[nH]c(=O)cc2" labels="1'/2'//3'//4'/5'///////1/2//3/4//5/6" functionalIDs="11,12">5'-uridylic acid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)[nH]c(=O)cc2C(=O)O" labels="1'/2'//3'//4'/5'///////1/2//3/4//5/6///" functionalIDs="11,12">5'-orotidylic"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)[nH]c(=O)cc2C(=O)O" labels="1'/2'//3'//4'/5'///////1/2//3/4//5/6///" functionalIDs="11,12">5'-orotidylicacid"
      "[C@@H]1([C@H](O)[C@H](O)[C@@H](COP(=O)(O)O)O1)n2c(=O)[nH]c(=O)cc2C(=O)O" labels="1'/2'//3'//4'/5'///////1/2//3/4//5/6///" functionalIDs="11,12">5'-orotidylic acid"
   

}

=end
  
end
