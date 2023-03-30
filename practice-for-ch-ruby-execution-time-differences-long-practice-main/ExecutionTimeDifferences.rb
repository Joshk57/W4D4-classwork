
# O(3n * 2n)
# O(6n^2)
# O(n^2)
# def my_min(list)
#     list.each do |ele1| # O(n)
#         smallest = true # constant
#         list.each do |ele2| # O(n)
#             smallest = false if ele2 < ele1 #constant + constant
#         end
#         return ele1 if smallest # constant + constant
#     end
# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# O(1) + O(3n) + O(1)
# O(1 + 3n + 1)
# O(n)
def my_min(list)
    num = list.first # constant O(1)
    list.each_with_index do |ele, i| # O(n)
        # if i > 0 && num > ele # constant + constant # i > 0 is not necessary
        if num > ele # constant + constant
            num = ele # constant
        end
    end    
    return num # constant
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5


# Look at time complexity and switch to Josh
# O(1 + n * (2*n) + n^2 + n)
# O(1 + 3n^2 + n)
# O(n^2 + n)
# O(n^2)

def largest_contiguous_subsum(list)

    sub_arrs = [] # constant

    (0...list.length).each do |idx1| # O(n)
        (idx1...list.length).each do |idx2| # O(n)
            sub_arrs << list[idx1..idx2] # constant + constant
        end
    end
    sub_arrs.map {|sub_arr| sub_arr.sum}.max # n^2 + n
end




list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

# possible sub-sums
[5]           # => 5
[5, 3]        # => 8 --> we want this one
[5, 3, -7]    # => 1
[3]           # => 3
[3, -7]       # => -4
[-7]          # => -7