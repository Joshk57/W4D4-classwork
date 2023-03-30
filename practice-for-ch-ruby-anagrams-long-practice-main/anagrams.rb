require 'byebug'
def first_anagram?(str1, str2)
	anagrams = str1.split("").permutation.to_a.map { |permutation| permutation.join("") }
	anagrams.include?(str2)
end


p first_anagram?("gizmo","sally")
p first_anagram?("elivs","lives")


def second_anagram?(str1, str2)
	arr1 = str1.split("")
	arr2 = str2.split("")
	arr1.each_with_index do |char, idx1|
		idx2 = arr2.index(char)
		# debugger
		(idx2.nil?) ? (return false) : arr2.delete_at(idx2)
		# if idx2.nil?
		# 	return false
		# else
		# 	arr2.delete_at(idx2)
		# end
	end
	arr2.empty?
end

p second_anagram?("gizmo","sally")
p second_anagram?("elivs","lives")
p second_anagram?("elivs","livest")