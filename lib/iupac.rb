require_relative 'iupac/version'

module Iupac_convention

  Suffix =                    #   This is a constant definition
      {                       # This is a hash (i.e. associative array  where a number of 'keys' are associated with corresponding 'values')
    :alkane => "ane",
     :alcohol => "ol",
     
  }
  
  
  Regex_suffix = Regexp.new(/(#{Suffix.values.join('|')})\z/)   # Creating a new regular expression defined between / /
        # '.values' calls all the values stored in Suffix (an array is returned), concatenate all the entries of the array with intermediate '|'   
  #   #{...} evaluates the above string
  #  \z is a regular expression anchor to match at the end of a String
   
end # of module Iupac_convention

class IupacName
  include Iupac_convention
  
  attr_accessor :compound_name   # creates an instance variable (@compound_name) and a corresponding access method to read it. 
                                  #creates a method called compound_name= to set the attribute.
  attr_reader :compound_suffix, :left_over ,:comment  # same without the method to set the attribute
  
  def initialize(option={})  #called whenever you create a new instance 
    #@option=option
    @compound_name = option[:compound_name] # 
    @compound_name && analyse_name_and_comment 
 
  end
  
  def analyse_name_and_comment
    analyse_name
    comment
  end
  
  def analyse_name
    if check_input #  check that you have a string input  (vide infra)
       # and copy compound name into a variable( @left_over). This is to be matched sequentially against regexp 
      # with the corresponding find_... function (vide infra). See find_suffix for more details
      # 
       find_suffix
       find_multiplier
       find_position
       find_length
    
          
    end
    
  end
  
 
  private
  
  def comment  #note that here, I am overwriting the method created with attr_reader, and having it under private makes it not possible to read the comment of an instance directly
    
    @comment="compound name is "+@compound_name.to_s+"\n"
    @comment << "suffix is " << @compound_suffix.to_s
    @comment <<"\n" << "belongs to " 
    @comment += Suffix.key(@compound_suffix.to_s).to_s  
    # add multiplicity position length...
    puts @comment
  end
  
 
  
  def check_input #return nil if no valid input (no string)
    @compound_name = (@compound_name.is_a?(String) && @compound_name.rstrip ) || nil    # rstrip (a hidden 'end of string'-anchored regular expression match) will clean our string from unwanted blanks 
    @left_over = @compound_name 
  end
  
  #### function to parse the chemical name
  ## each function takes @left_over tries to find something anchored at the end of the string, chomps it off of @left_over if found, and stores it somewhere
  
  def find_suffix
     @compound_suffix = nil
     @left_over =~ Regex_suffix &&  (@compound_suffix, @left_over = $1, $`)  #$1 is the first successful match (assigned to @compound_suffix), $` is what is located left of the match (assigned to @left_over).
     @compound_suffix ||=  "not listed"     #@compound_suffix is defined (through a successful match in the previous line) or "not listed" is attributed
  end
   
  def find_multiplier
    #take @left_over and match against di tri tetra ....
    #@multiplier should be an integer
  end
  
  def find_position
    #take @left_over and match against position regexp 
    #@position should be an array of integer (array length = @multiplier)
  end
  
  def find_length
    #find length of the main alkane chain, integer
  end
  
end # of class IupacName

def test_iupac
   # this method, when called, will instantiate a couple of IupacName and test whether it understands the associated names
   alcane_test_name = ["methane","ethane", "propane"]
   alcohol_test_name = ["ethanol", "ethan-1-ol", "ethan-1,2-diol","ethan-1, 2-diol", "propanol", "propan-2-ol"]
     
   (alcane_test_name+alcohol_test_name+["ethanal"]).each{|s| IupacName.new({:compound_name => s})}
   puts "testing ends"
 end #of test_iupac
