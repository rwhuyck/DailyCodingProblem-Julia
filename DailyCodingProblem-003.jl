#=
Good morning! Here's your coding interview problem for today.

This problem was asked by Google.

Given the root to a binary tree, implement serialize(root), 
which serializes the tree into a string, and deserialize(s), 
which deserializes the string back into the tree.

For example, given the following Node class

class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

The following test should pass:

node = Node('root', Node('left', Node('left.left')), Node('right'))
assert deserialize(serialize(node)).left.left.val == 'left.left'
=#

# Binary tree structure with inner constructor for incomplete initialization
mutable struct node
    value::String
    left::node
    right::node

    node() = new()
end

# Base method, which calls the overloaded method by passing index value
function buildTree(input::Array{String,1})
    if length(input) > 0
        buildTree(input, 1)
    else
        error("No valid input entered")
    end
end

# Overloaded buildTree method, which now initializes and then constructs
# the binary tree based on the input array. Fulfills the "deserialize"
function buildTree(input::Array{String,1}, index)
    tree = node()
    tree.value = input[index]

    if index == 1
        if index + 1 <= length(input)
            i = index + 1
            tree.left = buildTree(input, i)
        end
        if index + 2 <= length(input)
            i = index + 2
            tree.right = buildTree(input, i)
        end
    else
        if (index * 2) <= length(input)
            i = index * 2
            tree.left = buildTree(input, i)
        end
        if (index * 2 + 1) <= length(input)
            i = index * 2 + 1
            tree.right = buildTree(input, i)
        end
    end

    return tree
end

# Breadth-First Search -- turns binary tree back into string using a queue
# Fulfills the "serialize"
function serialize(tree::node)
    queue::Array{node,1} = []
    result::String = ""
    push!(queue, tree)

    while length(queue) > 0 
        node = popfirst!(queue)
        result *= node.value * " "

        if isdefined(node, :left)
            push!(queue, node.left)
        end
        if isdefined(node, :right)
            push!(queue, node.right)
        end
    end

    return result
end

# Driver code ########

const message = "This will soon be a tree, then back to a sentence"

textArr = split(string(message))
textArr = convert(Array{String}, textArr)

tree = buildTree(textArr)
println(tree)

result = serialize(tree)
result = rstrip(result)
println(result)