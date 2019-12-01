#=
Good morning! Here's your coding interview problem for today.

This problem was asked by Google.

A unival tree (which stands for "universal value") is a tree where all nodes under it have the same value.

Given the root to a binary tree, count the number of unival subtrees.

For example, the following tree has 5 unival subtrees:

   0
  / \
 1   0
    / \
   1   0
  / \
 1   1

=#

mutable struct Node
    value::Int8
    left::Node
    right::Node

    Node() = new()
end

function main()
    tree::Node = buildTree()
    count::Int8 = numUnival(tree)
    println(count)
end

function buildTree()
    tree = Node()
    tree.left = Node()
    tree.right = Node()
    tree.right.right = Node()
    tree.right.left = Node()
    tree.right.left.left = Node()
    tree.right.left.right = Node()
    tree.left.value = 1
    tree.right.value = 0
    tree.right.right.value = 0
    tree.right.left.value = 1
    tree.right.left.left.value = 1
    tree.right.left.right.value = 1

    return tree
end

function numUnival(tree::Node)
    count::Int8 = 0

    if !isdefined(tree, :left) || !isdefined(tree, :right)
        count += 1
    elseif isUnival(tree)
        count = numUnival(tree.left) + numUnival(tree.right) + 1
    else
        count = numUnival(tree.left) + numUnival(tree.right)
    end

    return count
end

function isUnival(tree::Node)
    result::Bool = false

    if !isdefined(tree, :left) || !isdefined(tree, :right)
        result = true
    elseif isdefined(tree, :left) && tree.left.value != tree.value
        result = false
    elseif isdefined(tree, :right) && tree.right.value != tree.value
        result = false
    elseif isUnival(tree.left) && isUnival(tree.right)
        result = true
    end

    return result
end

main()