#=
Good morning! Here's your coding interview problem for today.

This problem was asked by Google.

An XOR linked list is a more memory efficient doubly linked list. 
Instead of each node holding next and prev fields, it holds a field 
named both, which is an XOR of the next node and the previous node. 
Implement an XOR linked list; it has an add(element) which adds the 
element to the end, and a get(index) which returns the node at index.

If using a language that has no pointers (such as Python), 
you can assume you have access to get_pointer and dereference_pointer 
functions that converts between nodes and memory addresses.
=#

mutable struct Node
    xorNode::Ptr{Node}
    value::Int32

    Node() = new()
end

function main()
    a::Int32 = 1
    b::Int32 = 23
    c::Int32 = 432
    
    index::Int32 = 1

    head = Ptr{Node}()
    addNode(a, head)
    addNode(b, head)
    addNode(c, head)

    getNode(head, index)
end

function xorNodes(nodeA::Ptr{Node}, nodeB::Ptr{Node})
    return xor(nodeA, nodeB)
end

function addNode(a::Int32, headNode::Ptr{Node})
    newNode = Node()
    newNode.value = a
    newNode.xorNode = xorNodes(headNode, Ptr{Node}())

    if headNode != Ptr{Node}()
        nextNode::Ptr{Node} = xorNodes(headNode.xorNode, Ptr{Node}())
        headNode.xorNode = xorNodes(Ptr{Node}(newNode), nextNode)
    end

    headNode = Ptr{Node}(newNode)
end

function getNode(headNode::Node, index::Int32)

    curr = Ptr{Node}(headNode)
    prev = Ptr{Node}()
    next = Ptr{Node}()
    
    keepGoing = true

    while curr != Ptr{Node}() && keepGoing
        if index > 0
            index -= 1
            next = xorNodes(prev, curr.xorNode)
            
            prev = curr
            curr = next
        end
    end

    return curr.value
end

main()

