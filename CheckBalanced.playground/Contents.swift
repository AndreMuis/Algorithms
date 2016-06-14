//
// Check if a binary search tree is balanced
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

func checkHeights(rootNode rootNode : Node?) -> Int
{
    var height : Int
    
    if let root = rootNode
    {
        let leftHeight : Int = checkHeights(rootNode: root.left)
        let rightHeight : Int = checkHeights(rootNode: root.right)
        
        if leftHeight == Int.min
        {
            height = leftHeight
        }
        else if rightHeight == Int.min
        {
            height = rightHeight
        }
        else
        {
            let difference : Int = leftHeight - rightHeight
            
            if abs(difference) >= 2
            {
                height = Int.min
            }
            else
            {
                height = max(leftHeight, rightHeight) + 1
            }
        }
    }
    else
    {
        height = -1
    }
  
    return height
}

func isBalanced(rootNode : Node) -> Bool
{
    let result : Bool = checkHeights(rootNode: rootNode) != Int.min
    
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

isBalanced(node20)


node15.left = nil
node15.right = nil

isBalanced(node20)










