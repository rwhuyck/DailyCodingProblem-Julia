#=
Good morning! Here's your coding interview problem for today.

This problem was asked by Stripe.

Given an array of integers, find the first missing positive integer
 in linear time and constant space. 
In other words, find the lowest positive integer that does not exist 
 in the array. The array can contain duplicates and negative numbers as well.

For example, the input [3, 4, -1, 1] should give 2. 
The input [1, 2, 0] should give 3.

You can modify the input array in-place.
=#

# Sort array, then move through it until missing sequential
# positive number is found, including if array end is reached
function findLowestPos(array::Array{Int64})
    array = sort(array)
    flag::Int64 = 1

    for i = 1:length(array)
        if array[i] > 0
            if flag != array[i]
                return flag
            elseif (i + 1) > length(array)
                flag += 1
            elseif array[i + 1] != array[i]
                flag += 1
            end
        end
    end

    return flag
end

array1 = [3, 4, -1, 1]
array2 = [1, 2, 0]

result = findLowestPos(array1)
result2 = findLowestPos(array2)

println(result)
println(result2)

