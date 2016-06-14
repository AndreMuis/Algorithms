//
// Given a binary search tree find the nodes at each level
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

func createLevelLists(rootNode rootNode : Node?, inout lists : [[Node]], level : Int)
{
    if let root = rootNode
    {
        if lists.count < level
        {
            let list : [Node] = [Node]()
            lists.append(list)
        }
        
        lists[level - 1].append(root)
        
        createLevelLists(rootNode: root.left, lists: &lists, level: level + 1)
        createLevelLists(rootNode: root.right, lists: &lists, level: level + 1)
    }
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


var lists : [[Node]] = [[Node]]()

createLevelLists(rootNode: node20, lists: &lists , level: 1)

for list : [Node] in lists
{
    for node : Node in list
    {
        print("\(node.value) ", separator: "", terminator: "")
    }
    
    print("")
}















