//
// Check if a binary tree is a subtree of another binary tree
//

import Foundation

class Node
{
    var value : String
    var left : Node?
    var right : Node?
    
    init(value : String)
    {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

func checSubtreeMatch(rootNode1 rootNode1 : Node?, rootNode2 : Node?) -> Bool
{
    var result : Bool = false

    if let node1 : Node = rootNode1,
        let node2 : Node = rootNode2
    {
        if checkTreesMatch(rootNode1: node1, rootNode2: node2)
        {
            result = true
        }
        else
        {
            result = checSubtreeMatch(rootNode1: node1.left, rootNode2: node2) ||
                checSubtreeMatch(rootNode1: node1.right, rootNode2: node2)
        }
    }
    else if rootNode1 == nil
    {
        result = false
    }
    
    return result
}

func checkTreesMatch(rootNode1 rootNode1 : Node?, rootNode2 : Node?) -> Bool
{
    var result : Bool = false
    
    if let node1 : Node = rootNode1,
        let node2 : Node = rootNode2
    {
        if (node1.value != node2.value)
        {
            result = false
        }
        else
        {
            result = checkTreesMatch(rootNode1: node1.left, rootNode2: node2.left) &&
                checkTreesMatch(rootNode1: node1.right, rootNode2: node2.right)
        }
    }
    else
    {
        if rootNode1 == nil && rootNode2 == nil
        {
            result = true
        }
        else if rootNode1 == nil || rootNode2 == nil
        {
            result = false
        }
    }
    
    return result
}


//
//     A         C       C
//    / \       / \     / \
//   B   C     D   E   D   F
//      / \
//     D   E
//

let node1A : Node = Node(value: "A")
let node1B : Node = Node(value: "B")
let node1C : Node = Node(value: "C")
let node1D : Node = Node(value: "D")
let node1E : Node = Node(value: "E")

node1A.left = node1B
node1A.right = node1C

node1C.left = node1D
node1C.right = node1E

let node2C : Node = Node(value: "C")
let node2D : Node = Node(value: "D")
let node2E : Node = Node(value: "E")

node2C.left = node2D
node2C.right = node2E

checSubtreeMatch(rootNode1: node1A, rootNode2: node2C)


let node3C : Node = Node(value: "C")
let node3D : Node = Node(value: "D")
let node3F : Node = Node(value: "F")

node3C.left = node3D
node3C.right = node3F

checSubtreeMatch(rootNode1: node1A, rootNode2: node3C)















