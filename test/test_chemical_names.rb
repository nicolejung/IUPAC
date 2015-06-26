module Test


  ##iupac name
  Alcane_test_name = [
    "1,2,3-tribromopropane",
    "2-methylbut-3-yn-2-ol",
    #"3-iodophenylbutane",
    "silatetradecane",
    # "Trimethyl acetate",
  ]

  Alcohol_test_name = [
    "ethanol",
    "ethan-1-ol",
    "ethan-1,2-diol",
    "ethane-1, 2-diol",
    "propanol", "propan-2-ol",
    "pentane-2,3,4-triol"]

  Ultimate_braket_name =[
    "4-(1,1-dimethylethyl)-5-ethylnonane",
    "3-ethyl-4,8-dimethylnonan",
    "7-ethyl-2,6-dimethylnonane",
    #"1-[1-(2-{5-[(4'-cyanobipent-2-yl)oxy]pentyl}oxy)carbonyl] ethane",
  ]
  Sec_fg_name = [
    "2-oxo-3-hydroxybutanoic acid",
    "2,4 dicyanopentanoic acid",
    " 2-hydroxypropane-1,2,3-tricarboxylic acid",
    "18-bromo-12-butyl-11-chloro-4,8-diethyl-5-hydroxy-15-methoxytricosan-3,9-dione",

  ]
  Bracket =[
    "10-bromo-5-(2-hydroxyhept-2-yne) dodeca-3,9,7-tricarboxylic acid",
    "10-bromo-5-hydroxytetracosa-3,9,12-tricarboxylic acid",
  ]


  #smiles name
  Alcohol_test_name_smiles = [
    "CCO",
    "C(O)C",
    "C(O)CO",
  ]

  #ruby name
  Alcohol_test_name_ruby = [
    [[:C,"O"],[:C]],

  ]
  Test_chem=[[[:C, "OH"], [:C, "Cl"]]]
      Complicated_test_name=[[[:C, "OH"], [:C, "C(O)O","OH"], [:C, "C(O)O"], [:C, "Cl"]] ]#, [[:C], [:C], [:C, "=O"], [:C], [:C, "OH"], [:C], [:C], [:C], [:C, "=O"], [:C], [:C, "Cl"], [:C], [:C], [:C], [:C, "OH"], [:C], [:C], [:C, "Br"], [:C], [:C], [:C], [:C], [:C]]]


end # module Test
