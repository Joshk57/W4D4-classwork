
def bad_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        ((i+1)...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum

        end
    end
    false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
    return false if arr.length <= 1
    sorted = arr.sort

    missing_half = target_sum - sorted.first
    if sorted[1..-1].include?(missing_half)
        return true
    else
        okay_two_sum?(sorted[1..-1], target_sum)
    end
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false