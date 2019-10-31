#=
Good morning! Here's your coding interview problem for today.

This problem was asked by Uber.

Given an array of integers, return a new array such that each element at index i 
of the new array is the product of all the numbers in the original array except 
the one at i.

For example, if our input was [1, 2, 3, 4, 5], the expected output would be 
[120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected 
output would be [2, 3, 6].

Follow-up: what if you can't use division?
=#

array = [1, 2, 3, 4, 5]
array2 = [3, 2 ,1]

function intraProduct(a::Array)
    resultArray = Array{Int64}(undef, length(a))

    for i::Int32 = 1:length(a)
        resultArray[i] = elemProduct(a, i)
    end

    return resultArray
end

function elemProduct(a::Array, i::Int32)
    result = 1
    
    for j = 1:length(a)
        if i != j
            result *= a[j]
        end
    end
    
    return result
end

# Prints [120, 60, 40, 30, 24]
println(intraProduct(array))

# Prints [2, 3, 6]
println(intraProduct(array2))
