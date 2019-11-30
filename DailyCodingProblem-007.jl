#=
Good morning! Here's your coding interview problem for today.

This problem was asked by Facebook.

Given the mapping a = 1, b = 2, ... z = 26, and an encoded message, 
count the number of ways it can be decoded.

For example, the message '111' would give 3, 
since it could be decoded as 'aaa', 'ka', and 'ak'.

You can assume that the messages are decodable. For example, 
'001' is not allowed.
=#

function waysDecoded(input::String)
    result = 0

    if length(input) == 1 && parse(Int8, input) > 0

        result += 1

    elseif length(input) == 2 && parse(Int8, input) > 0

        result += 1

        if parse(Int8, input) <= 26 && parse(Int8, input) >= 10
            result += 1
        end

    else

        result = waysDecoded(input[2:end])
        
        if parse(Int8, input[1:2]) <= 26 && parse(Int8, input[1:2]) >= 10
            result += waysDecoded(input[3:end])
        end
    end

    return result
end

message = "111"
output = waysDecoded(message)
println(output)