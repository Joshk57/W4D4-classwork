
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