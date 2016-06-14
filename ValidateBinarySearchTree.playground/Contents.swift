//
// Determine if a binary search tree is valid
//

import Foundation

class Node
{
    var value : Int
    var left : Node?
    var right : Node?
    
    init(value : Int)
    {
        self.value = value
        self.left = nil
        self.right = nil
    }
}


var previousNode : Node? = nil

func isValid(rootNode rootNode : Node?) -> Bool
{
    var result : Bool = true
    
    if let root = rootNode
    {
        if isValid(rootNode: root.left) == false
        {
            result = false
        }
        
        if let previous = previousNode where root.value <= previous.value
        {
            result = false
        }
        
        previousNode = root
        
        if isValid(rootNode: root.right) == false
        {
            result = false
        }
    }

    return result
}


//
//         20
//        /  \
//       /    \
//      /      \
//     15      23
//    /  \    /  \
//   5   17  21  34
//                 \
//                 101
//

let node5 : Node = Node(value: 5)
let node17 : Node = Node(value: 17)

var node15 : Node = Node(value: 15)
node15.left = node5
node15.right = node17

let node101 : Node = Node(value: 101)

var node34 : Node = Node(value: 34)
node34.right = node101

let node21 : Node = Node(value: 21)

var node23 : Node = Node(value: 23)
node23.left = node21
node23.right = node34

var node20 : Node = Node(value: 20)
node20.left = node15
node20.right = node23


isValid(rootNode: node20)


node17.value = 21
isValid(rootNode: node20)


