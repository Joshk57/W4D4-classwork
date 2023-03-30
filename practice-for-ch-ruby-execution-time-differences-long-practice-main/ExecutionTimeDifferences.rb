
# O(3n * 2n)
# O(6n^2)
# O(n^2)
def my_min(list)
    list.each do |ele1| # O(n)
        smallest = true # constant
        list.each do |ele2| # O(n)
            smallest = false if ele2 < ele1 #constant + constant
        end
        return ele1 if smallest # constant + constant
    end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

def my_min(list)


end