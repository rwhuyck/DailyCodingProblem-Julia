#=
Good morning! Here's your coding interview problem for today.

This problem was recently asked by Google.

Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

Bonus: Can you do this in one pass?
=#

array = [10, 15, 3, 7]

k = 17

function isAddend(array, k)
    result = false

    for i in array
        x = k - i
        if x > 0
            result = inArray(array, x)
        end
    end

    return result
end

#= Function returns true if x is inside the array. 
It uses findfirst() with isequal() to return the index of any value in array
that is equal to x.
If no value found, it returns [nothing], which when passed to isnothing() 
will return as true for there being no matching addend.
So, taking the negation of isnothing() returns true if x is inside the array.
=#
function inArray(array, x)
    if !isnothing(findfirst(isequal(x), array)) 
        result = true
    else
        result = false
    end
end

# Prints true for k = 17, prints false for k = 11
println(isAddend(array, k))