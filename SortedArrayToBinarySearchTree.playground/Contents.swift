//
// Convert a sorted array to a binary search tree with minimal height
//

import Foundation

class Node
{
    var number : Int
    var left : Node?
    var right : Node?
    
    init(number : Int)
    {
        self.number = number
        self.left = nil
        self.right = nil
    }
}

func createBinarySearchTree(numbers numbers : [Int], start : Int, end : Int) -> Node?
{
    if (start > end)
    {
        return nil
    }
    
    let median : Int = (start + end) / 2
    
    let node : Node = Node(number: numbers[median])
    
    node.left = createBinarySearchTree(numbers: numbers, start: start, end: median - 1)
    node.right = createBinarySearchTree(numbers: numbers, start: median + 1, end: end)

    return node
}

func printBinarySearchTree(rootNode rootNode : Node?)
{
    if let root = rootNode
    {
        print("number: \(root.number) left: \(root.left?.number) right: \(root.right?.number)")
        
        printBinarySearchTree(rootNode: root.left)
        printBinarySearchTree(rootNode: root.right)
    }
    else
    {
        return
    }
}


let numbers : [Int] = [3, 4, 7, 9, 13, 22, 23, 30]

let rootNode = createBinarySearchTree(numbers: numbers, start: 0, end: numbers.count - 1)

printBinarySearchTree(rootNode: rootNode)




