def first_anagram?(str1, str2)
	anagrams = str1.split("").permutation.to_a.map { |permutation| permutation.join("") }
	anagrams.include?(str2)
end

p first_anagram?("gizmo","sally")
p first_anagram?("elivs","lives")

