//: Playground - noun: a place where people can play

import UIKit

class Node
{
    var leftNode : Node?
    var rightNode : Node?
    var value : Int
    
    init(value : Int)
    {
        self.leftNode = nil
        self.rightNode = nil
        self.value = value
    }
}

func addNode(rootNode rootNode : Node, node : Node)
{
    if (node.value < rootNode.value)
    {
        if let leftNode : Node = rootNode.leftNode
        {
            addNode(rootNode: leftNode, node: node)
        }
        else
        {
            rootNode.leftNode = node
            return
        }
    }
    else
    {
        if let rightNode : Node = rootNode.rightNode
        {
            addNode(rootNode: rightNode, node: node)
        }
        else
        {
            rootNode.rightNode = node
            return
        }
    }
}

func findNodeWithSmallestValue(rootNode rootNode : Node) -> Node
{
    if let leftNode : Node = rootNode.leftNode
    {
        return findNodeWithSmallestValue(rootNode: leftNode)
    }
    else
    {
        return rootNode
    }
}


let count : Int = 10

var numbers : [Int] = Array(count: count, repeatedValue: 0)

for i : Int in 0...count - 1
{
    numbers[i] = Int(arc4random() % 100 + 1)
}

numbers


var rootNode = Node(value: numbers[0])

for number in numbers[1...numbers.count - 1]
{
    var node : Node = Node(value: number)
    
    addNode(rootNode: rootNode, node: node)
}


let nodeWithSmallestValue : Node = findNodeWithSmallestValue(rootNode: rootNode)
nodeWithSmallestValue.value









