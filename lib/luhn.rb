
module Luhn
  def self.is_valid?(number)
    
    #Taking integer, splitting it by intervals of 0 to a string
    #then mapping each individual character to an integer in an array
    split = number.to_s.split(//).map{|c| c.to_i}
    #Reversing the list to count from the right most digit
    reversed = split.reverse   
    #Creating an array of integers to transform
    n = 2
    selecting = (n - 1).step(reversed.size - 1, n).map{|i| reversed[i]}
    #Creating an arry of integers to leave alone
    unchanged = (n - 2).step(reversed.size - 1, n).map{|i| reversed[i]}
    #Double and subtract 9 if >= than 10
    transform = selecting.map do |n|
      n = n * 2
      if n >= 10
        n -= 9
      else
        n = n
      end
    end  
    #Combining the updated numbers and the original unchanged values
    newlist = unchanged + transform
    #Summing all integers
    sum = newlist.reduce(0, :+)
    if sum % 10 == 0
      return true
    else
      return false      
    end
  end
end
