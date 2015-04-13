class Sample
  def Hello
  end
  puts "Hello World"

  z=10
  if z>2
    puts "z is greater than 2"
  else
    if z<=2
      puts "z is 1"
    else puts "I can't guess z"
    end

  end
end

ob =Sample.new
ob.Hello

class Chemical_name < String

    
    #all_pos=/-\(|\)|\{|\}|\[|\]-/
# 
    # 4,4'-{1-[({5-[(4'-cyanobiphenyl-4-yl)oxy]pentyl}oxy)carbonyl]-2-[(4'-cyanobiphenyl-4-yl)oxy]ethylene}dibenzoic acid
    # match for position at the end of the chemical_name
    
#a=gets
a=Chemical_name.new(gets.chomp)

#a= Chemical_name 
puts a.find_position.to_s

       
    def brackets()
      i = 0;

      for i in 0..500 
        (Chemical_name[i] == '(') 
        i++
      puts "The number of brackets is #{i.to_i}"

    
     
=begin

    /**Converts a list of characters into a string.
     * 
     * @param l A list of characters.
     * @return The corresponding string.
     */
    public static String listToString(List<Character> l) {
      StringBuffer sb = new StringBuffer();
      for(char c : l) {
        sb.append(c);
      }
      return sb.toString();
    }
    
    /**Converts a string to a list of characters.
     * 
     * @param s A string.
     * @return The corresponding list of characters.
     */
    public static List<Character> stringToList(String s) {
      List<Character> cl = new ArrayList<Character>();
      for(int i=0;i<s.length();i++) {
        cl.add(s.charAt(i));
      }
      return cl;
    }
    
    /**Produce repetitions of a string. Eg. HelloWorld * 2 = HelloWorldHelloWorld.
     * 
     * @param s The string to multiply.
     * @param n The number of times to multiply it.
     * @return The multiplied string.
     */
    public static String multiplyString(String s, int n) {
      StringBuffer sb = new StringBuffer();
      for(int i=0;i<n;i++) {
        sb.append(s);
      }
      return sb.toString();
    }
    
    public static boolean isLackingOpenBracket(String s) {
      int bracketLevel = 0;
      for(int i=0;i<s.length();i++) {
        char c = s.charAt(i);
        if(c == '(' || c == '[' || c == '{') bracketLevel++;
        if(c == ')' || c == ']' || c == '}') bracketLevel--;
        if(bracketLevel == -1) return true;
      }
      return false;
    }
  
    public static boolean isLackingCloseBracket(String s) {
      int bracketLevel = 0;
      for(int i=s.length()-1;i>=0;i--) {
        char c = s.charAt(i);
        if(c == '(' || c == '[' || c == '{') bracketLevel--;
        if(c == ')' || c == ']' || c == '}') bracketLevel++;
        if(bracketLevel == -1) return true;
      }
      return false;
    }
    
    public static boolean bracketsAreBalanced(String s) {
      int bracketLevel = 0;
      for(int i=0;i<s.length();i++) {
        char c = s.charAt(i);
        if(c == '(' || c == '[' || c == '{') bracketLevel++;
        if(c == ')' || c == ']' || c == '}') bracketLevel--;
        if(bracketLevel == -1) return false;
      }
      if(bracketLevel == 0) return true;
      return false;
    }
    
    public static boolean isBracketed(String s) {
      if(s == null || s.length() < 3) return false;
      char first = s.charAt(0);
      char last = s.charAt(s.length()-1);
      if(!((first == '(' && last == ')') || (first == '[' && last == ']') || (first == '{' && last == '}'))) return false;
      if(!bracketsAreBalanced(s.substring(1, s.length()-2))) return false;
      return true;
    }
    
    public static String collectionToString(Collection<String> strings, String separator) {
      Object [] objArray = strings.toArray();
      String [] stringArray = new String[objArray.length];
      for(int i=0;i<objArray.length;i++) {
        stringArray[i] = (String)objArray[i];
      }
      return arrayToString(stringArray, separator);
    }
  
    public static String arrayToString(String [] stringArray, String separator) {
      StringBuffer sb = new StringBuffer();
      for(int i=0;i<stringArray.length-1;i++) {
        sb.append(stringArray[i]);
        sb.append(separator);
      }
      sb.append(stringArray[stringArray.length-1]);
      return sb.toString();
    }
    
    public static int lastIndexOfHyphen(String s) {
      int idx = -1;
      for(int i=0;i<hyphens.length();i++) {
        idx = Math.max(idx, s.lastIndexOf(hyphens.codePointAt(i)));
      }
      return idx;
    }
    
    public static String urlEncodeLongString(String s) {
      StringBuffer sb = new StringBuffer();
      int chunks = s.length() / 50;
      for(int i=0;i<chunks;i++) {
          sb.append(urlEncodeUTF8NoThrow(s.substring(i*50, (i+1)*50)));
          sb.append("\n");
      }
      sb.append(urlEncodeUTF8NoThrow(s.substring(chunks*50)));
      return sb.toString();
    }
    
    public static String urlEncodeUTF8NoThrow(String s) {
      try {
        return(URLEncoder.encode(s, "UTF-8"));
      } catch (UnsupportedEncodingException e) {
        throw new Error("Wot no UTF-8 for URLEncode?");
      }   
    }
    
    public static String intToBase62(int i) {
      String s = "";
      String start = "";
      if(i<0) {
        start = "-";
        i = -i;
      }
      do {
        int j = i % 62;
        s = base62.substring(j, j+1) + s;
        i = i / 62;
      } while (i > 0);
      return start+s;
    }
    
    public static String normaliseName(String name) {
      String [] subStrings = name.split("\\s+");
      for(int i=0;i<subStrings.length;i++) {
        if(twoLowerPattern.matcher(subStrings[i]).matches()) {
          subStrings[i] = subStrings[i].toLowerCase();
        }
        subStrings[i] = subStrings[i].replaceAll("\u00ad", "");
      }
      if(subStrings.length == 1) return subStrings[0];
      return arrayToString(subStrings, " ");
    }
    
    public static boolean testForAcronym(String potentialAcroymn, String reference) {
      potentialAcroymn = potentialAcroymn.toLowerCase();
      reference = reference.toLowerCase();
      int refpoint = 0;
      for(int i=0;i<potentialAcroymn.length();i++) {
        refpoint = reference.indexOf(potentialAcroymn.charAt(i), refpoint);
        if(refpoint == -1) return false;
        refpoint++;
      }
      return true;
    }
    
  }


=end

