//
// Count the number of paths in a binary tree that sum to a certain value
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

func countPathsWithSum(rootNode rootNode : Node, targetSum : Int) -> Int
{
    var pathCount : [Int : Int] = [Int : Int]()
    
    return countPathsWithSum(node: rootNode, targetSum: targetSum, runningSum: 0, pathCount: &pathCount)
}

func countPathsWithSum(node node : Node?, targetSum : Int, runningSum : Int, inout pathCount : [Int : Int]) -> Int
{
    var totalPaths : Int = 0
    
    if let node = node
    {
        var runningSum = runningSum
        
        runningSum += node.value
        
        let sum : Int = runningSum - targetSum
        
        totalPaths = pathCount[sum] ?? 0
        
        if (runningSum == targetSum)
        {
            totalPaths += 1
        }
        
        if let count = pathCount[runningSum]
        {
            pathCount[runningSum] = count + 1
        }
        else
        {
            pathCount[runningSum] = 1
        }
        
        totalPaths += countPathsWithSum(node: node.left, targetSum: targetSum, runningSum: runningSum, pathCount: &pathCount)
        totalPaths += countPathsWithSum(node: node.right, targetSum: targetSum, runningSum: runningSum, pathCount: &pathCount)
        
        if let count = pathCount[runningSum]
        {
            pathCount[runningSum] = count - 1
            
            if pathCount[runningSum] == 0
            {
                pathCount[runningSum] = nil
            }
        }
    }
    else
    {
        totalPaths = 0
    }

    return totalPaths
}


//
//         1
//        / \
//       /   \
//      /     \
//     2       3
//    / \     / \
//   4   5   6   7
//

var node1 : Node = Node(value: 1)
var node2 : Node = Node(value: 2)
var node3 : Node = Node(value: 3)
var node4 : Node = Node(value: 4)
var node5 : Node = Node(value: 5)
var node6 : Node = Node(value: 6)
var node7 : Node = Node(value: 7)

node1.left = node2
node1.right = node3

node2.left = node4
node2.right = node5

node3.left = node6
node3.right = node7


countPathsWithSum(rootNode: node1, targetSum: 1)

countPathsWithSum(rootNode: node1, targetSum: 6)

countPathsWithSum(rootNode: node1, targetSum: 10)








