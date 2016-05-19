//: Playground - noun: a place where people can play

import UIKit


// O(count * lg count)

let count : Int = 10

var numbers : [Int] = Array(count: count, repeatedValue: 0)

for i : Int in 0...count - 1
{
    numbers[i] = Int(arc4random() % 100 + 1)
}

numbers



func exchange(inout array: [Int], i: Int, j: Int)
{
    let tmp : Int = array[i]
    array[i] = array[j]
    array[j] = tmp
}

func leftLeafIndex(rootIndex: Int) -> Int
{
    let heapIndex : Int = rootIndex + 1
    let index : Int = heapIndex * 2 - 1
    
    return index
}

func rightLeafIndex(rootIndex: Int) -> Int
{
    let heapIndex : Int = rootIndex + 1
    let index : Int = heapIndex * 2 - 1 + 1
    
    return index
}

func lastNodeIndex(let array: [Int]) -> Int
{
    let index : Int = array.count - 1
    
    return index
}

func maxHeapify(inout array: [Int], rootIndex: Int)
{
    if leftLeafIndex(rootIndex) > lastNodeIndex(array)
    {
        return
    }
    
    let rootValue : Int = array[rootIndex]
    var largestIndex : Int = rootIndex
    var largestValue : Int = rootValue
    
    let leftLeafValue = array[leftLeafIndex(rootIndex)]
    
    if leftLeafValue > largestValue
    {
        largestValue = leftLeafValue
        largestIndex = leftLeafIndex(rootIndex)
    }
    
    if rightLeafIndex(rootIndex) <= lastNodeIndex(array)
    {
        let rightLeafValue = array[rightLeafIndex(rootIndex)]

        if rightLeafValue > largestValue
        {
            largestValue = rightLeafValue
            largestIndex = rightLeafIndex(rootIndex)
        }
    }
    
    if largestIndex != rootIndex
    {
        exchange(&array, i: rootIndex, j: largestIndex)
        maxHeapify(&array, rootIndex: largestIndex)
    }
}

func buildMaxHeap(inout array: [Int])
{
    if array.count <= 1
    {
        return
    }
    
    for index : Int in (0...array.count / 2).reverse()
    {
        maxHeapify(&array, rootIndex: index)
    }
}

func heapSort(constantArray: [Int]) -> [Int]
{
    var array = constantArray
    
    if array.count <= 1
    {
        return array
    }
    
    buildMaxHeap(&array)
    
    var sortedArray : [Int] = []
    while array.count > 1
    {
        sortedArray.insert(array[0], atIndex: 0)
        exchange(&array, i: 0, j: lastNodeIndex(array))
        array.removeLast()
        
        maxHeapify(&array, rootIndex: 0)
    }
    
    sortedArray.insert(array[0], atIndex: 0)
    
    return sortedArray
}


let numbersSorted = heapSort(numbers)










