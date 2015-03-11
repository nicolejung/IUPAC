require 'iupac/version'

module Iupac_convention

  Suffix =                    #   This is a constant definition
      {                     
    :alkane => "ane",
     :alcohol => "ol",
     
  }
  
  
  Regex_suffix = Regexp.new(/(#{Suffix.values.join('|')})\z/)
   
end # of module Iupac_convention

class IupacName
  include Iupac_convention
  
  attr_accessor :compound_name
  attr_reader :compound_suffix, :left_over ,:comment
  
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
    if check_input
       find_suffix
       find_multiplier
       find_position
       find_length
        
    end
    
  end
  
 
  private
  
  def comment
    
    @comment="compound name is "+@compound_name.to_s+"\n"
    @comment << "suffix is " << @compound_suffix.to_s
    @comment <<"\n" << "belongs to " 
    @comment += Suffix.key(@compound_suffix.to_s).to_s  
    # add multiplicity position length...
    puts @comment
  end
  
 
  
  def check_input
    @compound_name = (@compound_name.is_a?(String) && @compound_name.rstrip ) || nil
    @left_over = @compound_name.to_s
  end
  
  def find_suffix
     @left_over =~ Regex_suffix &&  (@compound_suffix, @left_over = $1, $`)
     @compound_suffix ||=  "not listed"
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
