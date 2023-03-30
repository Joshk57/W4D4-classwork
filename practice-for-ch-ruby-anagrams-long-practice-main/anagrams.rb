require 'byebug'
def first_anagram?(str1, str2)
	anagrams = str1.split("").permutation.to_a.map { |permutation| permutation.join("") }
	#O(1) + O(n) + O(n!) + O(n ^ 2) 
	#O(1 + n + n! + n^2 + 1)
	#O(n!)
	anagrams.include?(str2) # O(n)
end


p first_anagram?("gizmo","sally")
p first_anagram?("elivs","lives")

# O(1) + O(n) + O(1) + O(n) + (n^2 + n + 4) + O(1)
# O(n^2)

#(2n + 1) + ( n * (2n + 3))
def second_anagram?(str1, str2)
	arr1 = str1.split("") # O(1) + O(n) (2n +1)
	arr2 = str2.split("") # O(1) + O(n)
	arr1.each_with_index do |char, idx1| # O(n) * (2n +3)
		idx2 = arr2.index(char) # O(1) + O(n)
		# debugger
		(idx2.nil?) ? (return false) : arr2.delete_at(idx2) # O(1) + O(1) + O(n)
	end
	arr2.empty? # O(1)
end

p second_anagram?("gizmo","sally")
p second_anagram?("elivs","lives")
p second_anagram?("elivs","livest")

# nlogn
def third_anagram?(str1, str2)
	arr1 = str1.split("") # O(1 + n)
	arr2 = str2.split("") # O(1 + n)
	arr1.sort == arr2.sort # O(2nlogn)
end

puts
puts

p third_anagram?("gizmo","sally")
p third_anagram?("elivs","lives")
p third_anagram?("elivs","livest")

# def fourth_anagram?(str1, str2)
# 	letters(str1) == letters(str2)
# end

# def letters(str)
# 	hash = Hash.new(0)
# 	str.each_char do |char|
# 		hash[char] += 1
# 	end
# 	hash
# end

# O(7n) => # O(n)
def fourth_anagram?(str1, str2)
	hash = Hash.new(0) #constant
	str1.each_char do |char| # O(n)
		hash[char] += 1 # 2 const
	end
	str2.each_char do |char| # O(n)
		hash[char] -= 1 # 2 const
	end
	hash.values.all? { |v| v==0 } # O(n) + O(2n)
end

puts
puts

p fourth_anagram?("gizmo","sally")
p fourth_anagram?("elivs","lives")
p fourth_anagram?("elivs","livest")