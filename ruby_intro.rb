# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.inject(0){|sum,x| sum + x }
end

def max_2_sum arr
  if arr.empty?
   return 0
  end
  arr.max(2).reduce(:+)
end

def sum_to_n? arr, n
  if arr.empty?
   return false
  end
  arr.combination(2).any? {|a, b| a + b == n }
end

# Part 2

def hello(name)
  "Hello, " + name
end

def starts_with_consonant? s
  if s.empty?
   return false
  end
  if s[0] =~ /[A-Za-z]/
    if s.start_with?('a','e','i','o','u','A','E','I','O','U') 
      return false
    else
      return true
    end
  else
    return false
  end
end

def binary_multiple_of_4? s
  if s == "0" 
    return true
  end
  if /^[10]*00$/.match(s) != nil
    return true
  else
    return false
  end
end

# Part 3

class BookInStock
	attr_accessor :isbn
	attr_accessor :price

	def initialize(isbn, price)
		raise ArgumentError, 
			"Illegal argument" if isbn.empty?  or price <= 0
		@isbn = isbn
		@price = price
	end

	def price_as_string
		sprintf("$%2.2f", @price)
	end
end

#Sources for sample code and ideas 
#https://github.com/veelenga/wil/blob/master/course/saas/hw1/h1.rb
#https://stackoverflow.com/questions/26812757/how-do-i-count-vowels
#https://stackoverflow.com/questions/515478/converting-binary-data-to-string-in-ruby
#https://stackoverflow.com/questions/1538789/how-to-sum-array-of-numbers-in-ruby
#https://stackoverflow.com/questions/9809843/understanding-ruby-class-attributes-using-accessor-macros-and-self