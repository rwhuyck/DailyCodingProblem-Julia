#=
Good morning! Here's your coding interview problem for today.

This problem was asked by Jane Street.

cons(a, b) constructs a pair, and car(pair) and cdr(pair) returns 
the first and last element of that pair. 
For example, car(cons(3, 4)) returns 3, and cdr(cons(3, 4)) returns 4.

Given this implementation of cons:

def cons(a, b):
    def pair(f):
        return f(a, b)
    return pair

Implement car and cdr.
=#

struct cons
    a::Int64
    b::Int64
    cons(a, b) = new(a, b)
end 

function car(cons::cons)
    out = cons.a
    return out
end

function cdr(cons::cons)
    out = cons.b
    return out
end

result = car(cons(3, 4))
result2 = cdr(cons(3, 4))

println(result)
println(result2)