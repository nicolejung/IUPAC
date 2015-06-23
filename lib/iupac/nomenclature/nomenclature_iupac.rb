module Rules_iupac
  

  
  
###################################################   
#  Recommendations 1993
###################################################  
#  R-1 General Principles of Organic Nomenclature
#  
#
#  R-1.0 Introduction
#  
#  Systematic naming of an organic compound generally requires the identification and naming of a parent structure. 
#  This name may then be modified by prefixes, infixes, and, in the case of a parent hydride, suffixes,
#  which convey precisely the structural changes required to generate the actual compound from the parent structure.
#  
#  Most commonly, a parent structure is a parent hydride, i.e., a structure containing, besides hydrogen,
#  either a single atom of an element, for example, phosphane; a number of atoms (alike or different) linked together
#  to form an unbranched chain, for example, cyclohexane, pyridine, naphthalene, and quinoline. It is sometimes convenient
#  to employ parent hydrides, of more complex structure such as ring assemblies or ring/chain systems, for example, biphenyl,
#  styrene, ferrocene, and cyclophanes, and to include structures with implied stereochemistry (stereoparents), for example, 5-cholestane .
#  Rules for naming parent hydrides are given in R-2; in addition, a special class of parent structures termed functional parents, 
#  for example, phosphinic acid, is considered in R-3.3.
#  The substitutive operation, described in R-1.2.1, is the operation used most extensively in organic nomenclature. 
#  Indeed, the comprehensive nomenclature system based largely on the application of this operation to parent structures is,
#  for convenience, termed "substitutive nomenclature", although this system also involves many of the other types of operations described
#  in R-1.2. Examples of this and other nomenclature operations are shown in Table 1.
#  
#  
#  In constructing the names described in R-1.2.3.3.2 (formerly called "radicofunctional names"), the characteristic 
#  group of the compound is expressed as a functional class name, and is usually cited as a separate word rather than as a suffix.
#  In these recommendations, however, names obtained by a substitutive operation are preferred.
#  
#  The replacement operation can be used for naming organic compounds in which skeletal atoms of a parent structure 
#  are replaced by other skeletal atoms, or in which oxygen atom and/or hydroxy groups of characteristic groups are 
#  replaced by other atoms or groups.
#  
#  It is very important to recognize that, in general, the rules of organic nomenclature are written in terms of classical
#  valence bonding and do not imply electronic configurations of any kind.
#  
#  Examples of naming structures in several ways are shown in Table 1.
#  
#  Full details of the way in which parent names may be combined with appropriate prefixes and suffixes are given in R-4
#  (Name Construction); rules for selection of a unique systematic name, if required, will be described in a separate document.
#  Methods for the specification of stereochemistry are given in R-7 and those for denoting isotopic modification are described in R-8. 
#
#
#
  
#  R-1.1 Bonding Number   
#
#  R-1.1.1 Definition
#  
#  The bonding number "n" of a skeletal atom is the sum of the total number of bonding equivalents (valence bonds)
#  of the skeletal atom to adjacent skeletal atoms in a parent hydride, if any, and the number of attached hydrogen atoms, if any.        
#  
#   R-1.1.2 Standard bonding numbers
#   
#   The bonding number of a skeletal atom is standard when it has the value given in the following table:
#   
#   Standard bonding number (n)   Element
#   3   B         
#   4   C   Si  Ge  Sn  Pb
#   3   N   P   As  Sb  Bi
#   2   O   S   Se  Te  Po
#   1   F   Cl  Br  I   At    
  
  
  Standard_bonding_numbers = {
   :F   =>  1,
   #todo complete  
   
   :C   =>  4,
   }
  
   
  def R_1_1_2(element=nil,bonding_number=nil)

    
   if element.is_a?(Symbol)  && bonding_number.is_a?(Integer)  ## also check that element is in Standard_bonding_numbers.keys
     return Standard_bonding_numbers[element] == bonding_number
   end
    
  end # of Rule R-1.1.2 Standard bonding numbers

#  R-1.2 Nomenclature Operations    
#    R-1.2.1 Substitutive operation
#    R-1.2.2 Replacement operation
#    R-1.2.3 Additive operation
#    R-1.2.4 Conjunctive operation
#    R-1.2.5 Subtractive operation
#    R-1.2.6 Ring formation or cleavage
#    R-1.2.7 Rearrangement
#    R-1.2.8 Multiplicative operation

#    R-1.2.1 Substitutive operation
#The substitutive operation involves the exchange of one or more hydrogen atoms for another atom or group.
#This process is expressed by a prefix or suffix denoting the atom or group being introduced (see R-3.2 and R-4 for lists of prefixes and suffixes).
#Examples to R-1.2.1
#    Cyclohexane     ->     Chlorocyclohexane
#                          (substitutive prefix = chloro)
#    Ethane          ->    Ethanethiol
#                          (substitutive suffix = thiol)  

#  R-1.2.2 Replacement operation
#
#The replacement operation involves the exchange of one group of atom or a single nonhydrogen atom for another. This can be expressed in several ways as follow:
#R-1.2.2.1 By use of "a" prefixes representing the element(s) being introduced, usually signifying replacement of carbon (see R-9.3).  
#Examples to R-1.2.2.1
#Cyclohexane ->   Silacyclohexane
#(replacement prefix = sila)
#Phenanthrene -> 2,7,9-Triazaphenanthrene
#(replacement prefix = aza)

#
#R-1.2.2.2 By use prefixes or infixes signifying replacement of oxygen atoms or oxygen-containing group (see R-3.4). These affixes represent the group(s) being introduced.
#
#    Examples to R-1.2.2.2
#        (CH3)2P(O)(OCH3)                (CH3)2P(NH)(OCH3)
#        Methyl dimethylphosphinate     Methyl P,P-dimethylphosphinimidate
#       (replacement infix = imid(o))
#        C6H5P(O)(OH)2                 C6H5P(N)(OH)
#        Phenylphosphonic acid        Phenylphosphononitridic acid
#         (replacement infix = nitrid(o))
#
#The chalcogen affixes "thio-", "seleno-", and "telluro-" indicate replacement of an oxygen atom by another chalcogen atom.
#
#    Examples to R-1.2.2.2
#        Benzoic acid            ->   Selenobenzoic acid
#        2H-Pyran                ->      2H-Thiopyran
#        Hexanoic acid           ->  Hexane(dithioic) acid
#        4-Formylbenzoic acid    ->  4-(Selenoformyl)benzoic acid
  
  
  
#Table 2 Mononuclear hydrides

#BH3   Borane  OH2   Oxidane, ,
#CH4   Methane (Carbane)   SH2   Sulfane,
#SiH4  Silane  SH4   ,
#GeH4  Germane   SH6   ,
#SnH4  Stannane  SeH2  Selane, ,
#PbH4  Plumbane  TeH2  Tellane,
#NH3   Azane ,   PoH2  Polane,
#PH3   Phosphane (Phosphine)   FH  Fluorane,
#PH5   
#(Phosphorane)   ClH   Chlorane
#AsH3  Arsane (Arsine)   BrH   Bromane
#AsH5  (Arsorane)  IH  Iodane
#SbH3  Stibane (Stibine)   IH3   
#SbH5  (Stiborane)   IH5   
#BiH3  Bismuthane
#(Bismuthine)  AtH   Astatane 
#  
#R-9.3 "a" Prefixes Used in Replacement Nomenclature
#
#Table 33 "a" Prefixes used in replacement nomenclature.
#
#These are listed below in decreasing order of priority following each column downward in turn.
#
#Element   "a" prefix  Element   "a" prefix
#F      fluora   W      tungsta
#Cl     chlora   V      vanada
#Br     broma    Nb     nioba
#I      ioda     Ta     tantala
#At     astata   Ti     titana
#O      oxa      Zr     zircona
#S      thia     Hf     hafna
#Se     selena   Sc     scanda
#Te     tellura  Y      yttra
#Po     polona   La     lanthana
#N      aza      Ce     cera
#P      phospha  Pr     praseodyma
#As     arsa     Nd     neodyma
#Sb     stiba    Pm     prometha
#Bi     bisma    Sm     samara
#C      carba    Eu     europa
#Si     sila     Gd     gadolina
#Ge     germa    Tb     terba
#Sn     stanna   Dy     dysprosa
#Pb     plumba   Ho     holma
#B      bora     Er     erba
#Al     alumina  Tm     thula
#Ga     galla    Yb     ytterba
#In     inda     Lu     luteta
#Tl     thalla   Ac     actina
#Zn     zinca    Th     thora
#Cd     cadma    Pa     protactina
#Hg     mercura  U      urana
#Cu     cupra    Np     neptuna
#Ag     argenta  Pu     plutona
#Au     aura     Am     america
#Ni     nickela  Cm     cura
#Pd     pallada  Bk     berkela
#Pt     platina  Cf     californa
#Co     cobalta  Es     einsteina
#Rh     rhoda    Fm     ferma
#Ir     irida    Md     mendeleva
#Fe     ferra    No     nobela
#Ru     ruthena  Lr     lawrenca
#Os     osma     Be     berylla
#Mn     mangana  Mg     magnesa
#Tc     techneta Ca     calca
#Re     rhena    Sr     stronta
#Cr     chroma   Ba     bara
#Mo     molybda  Ra     rada
  
end # of module IUPAC_rules