class Chemical_name< String
#Compund name would be inherited from string class of ruby


find_length =
{ 
:meth => "1",
:eth => "2",
:prop => "3",
:but => "4",
:pent => "5",
:hex => "6",
:hept => "7",
:oct=> "8",
:non=> "9",
:dec=> "10",
:undec=> "11",
:dodec=> "12",

}

a= Chemical_name.new("octa-1,2-ol")

find_length.each_pair do |k,v|
  x=~/#{v}/
  puts "The given compound has #{k} carbons"
end

end

