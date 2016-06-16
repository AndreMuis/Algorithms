//
// Find a random node in a binary search tree
//

import Foundation

class Node
{
    var value : Int
    var size : Int
    var left : Node?
    var right : Node?
    
    init(value : Int)
    {
        self.value = value
        self.size = 1
        self.left = nil
        self.right = nil
    }
    
    func insert(node node : Node)
    {
        if node.value <= self.value
        {
            if let left = self.left
            {
                left.insert(node: node)
            }
            else
            {
                self.left = node
            }
        }
        else
        {
            if let right = self.right
            {
                right.insert(node: node)
            }
            else
            {
                self.right = node
            }
        }
        
        self.size += 1
    }
    
    func getRandomNode() -> Node?
    {
        var result : Node?
        
        let index : Int = Int(arc4random()) % self.size
        
        if let left = self.left where index < left.size
        {
            result = left.getRandomNode()
        }
        else if index == self.size - 1
        {
            result = self
        }
        else if let right = self.right
        {
            result = right.getRandomNode()
        }
        
        return result
    }
}

class BinarySearchTree
{
    var rootNode : Node
    
    init(rootNode : Node)
    {
        self.rootNode = rootNode
    }

    func insert(node node : Node)
    {
        self.rootNode.insert(node: node)
    }

    func getRandomNode() -> Node?
    {
        return self.rootNode.getRandomNode()
    }
}


var node : Node = Node(value: 1)
var tree : BinarySearchTree = BinarySearchTree(rootNode: node)

node = Node(value: 3)
tree.insert(node: node)

node = Node(value: 2)
tree.insert(node: node)

node = Node(value: 5)
tree.insert(node: node)

node = Node(value: 4)
tree.insert(node: node)


let iterations = 2000
var occurences : Int = 0

for _ in 1 ..< iterations
{
    node = tree.getRandomNode()!
    
    if node.value == 1
    {
        occurences += 1
    }
}

Float(occurences) / Float(iterations)









