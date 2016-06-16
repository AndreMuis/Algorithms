//
// Find the first common ancestor of two nodes in a binary tree
//

import Foundation

class Node
{
    var value : Int
    var parent : Node?
    var left : Node?
    var right : Node?
    
    init(value : Int)
    {
        self.value = value
        self.parent = nil
        self.left = nil
        self.right = nil
    }
}

func commonAncestor(node1 node1 : Node, node2 : Node) -> Node?
{
    let depth1 : Int = depth(node1)
    let depth2 : Int = depth(node2)
    
    let difference = depth1 - depth2
    
    var someNode1 : Node? = node1
    var someNode2 : Node? = node2
    
    if difference >= 1
    {
        someNode1 = moveUp(node1, levels: difference)
        someNode2 = node2
    }
    else if difference <= -1
    {
        someNode1 = node1
        someNode2 = moveUp(node2, levels: -difference)
    }

    var ancestor : Node? = nil
    
    while (someNode1 != nil && someNode2 != nil)
    {
        if someNode1 === someNode2
        {
            ancestor = someNode1
            break
        }
        
        someNode1 = someNode1?.parent
        someNode2 = someNode2?.parent
    }
    
    return ancestor
}

func moveUp(node : Node, levels : Int) -> Node
{
    var someNode : Node = node

    for _ in 0 ..< levels
    {
        if let parent : Node = someNode.parent
        {
            someNode = parent
        }
    }
    
    return someNode
}

func depth(node : Node) -> Int
{
    var depth = 0
    var someNode : Node? = node
    
    while someNode?.parent != nil
    {
        someNode = someNode?.parent
        depth += 1
    }
    
    return depth
}


//
//     20
//    /  \
//   15  23
//      /  \
//     21  34
//    /   /  \
//   88  30  101
//        \
//        33
//

let node20 : Node = Node(value: 20)
let node15 : Node = Node(value: 15)
let node23 : Node = Node(value: 23)
let node21 : Node = Node(value: 21)
let node34 : Node = Node(value: 34)
let node88 : Node = Node(value: 88)
let node30 : Node = Node(value: 30)
let node101 : Node = Node(value: 101)
let node33 : Node = Node(value: 33)

node20.left = node15
node20.right = node23

node15.parent = node20

node23.parent = node20
node23.left = node21
node23.right = node34

node21.parent = node23
node21.left = node88

node34.parent = node23
node34.left = node30
node34.right = node101

node88.parent = node21

node30.parent = node34
node30.right = node33

node101.parent = node34

node33.parent = node30


var node : Node? = commonAncestor(node1: node33, node2: node101)
node?.value

node = commonAncestor(node1: node33, node2: node21)
node?.value

node = commonAncestor(node1: node15, node2: node101)
node?.value










