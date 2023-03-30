
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

#Phase 1
# def largest_contiguous_subsum(list)

#     sub_arrs = [] # constant

#     (0...list.length).each do |idx1| # O(n)
#         (idx1...list.length).each do |idx2| # O(n)
#             sub_arrs << list[idx1..idx2] # constant + constant
#         end
#     end
#     sub_arrs.map {|sub_arr| sub_arr.sum}.max # n^2 + n
# end

# #Phase 2
# def largest_contiguous_subsum(list)
#     largest_sum = list.first #5 => 8
#     current_sum = 0
#     list.each_with_index do |num, idx| #-7, 2
#         if idx > 0
#             if largest_sum < largest_sum + num # 8 < 1
#                 largest_sum += num #
#             end
#         end
#     end
#     largest_sum
# end
def largest_contiguous_subsum(list)
    largest_sum = list.first
    current_sum = list.first

    list.each_with_index do |num, idx|
        next if idx == 0
        current_sum += num
        if num > largest_sum
            largest_sum = num
        end
        if current_sum > largest_sum
            largest_sum = current_sum
        end
        if current_sum < 0
            current_sum = 0
        end
    end
    return largest_sum
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

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])