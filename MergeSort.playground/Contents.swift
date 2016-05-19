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



func mergeSort(array : [Int]) -> [Int]
{
    if array.count <= 1
    {
        return array
    }
    
    let middle : Int = array.count / 2
    
    let left : [Int] = Array(array[0...middle - 1])
    let leftSorted : [Int] = mergeSort(left)
    
    let right : [Int] = Array(array[middle...array.count - 1])
    let rightSorted : [Int] = mergeSort(right)

    return merge(leftSorted, rightArray: rightSorted)
}

func merge(leftArray : [Int], rightArray : [Int]) -> [Int]
{
    var result : [Int] = [Int]()
    
    var left : [Int] = leftArray
    var right : [Int] = rightArray
    
    while(left.isEmpty == false || right.isEmpty == false)
    {
        if left.isEmpty == false && right.isEmpty == false
        {
            if left.first < right.first
            {
                result.append(left.first!)
                left.removeFirst()
            }
            else
            {
                result.append(right.first!)
                right.removeFirst()
            }
        }
        else if left.isEmpty == false
        {
            result.append(left.first!)
            left.removeFirst()
        }
        else if right.isEmpty == false
        {
            result.append(right.first!)
            right.removeFirst()
        }
    }
    
    return result
}

mergeSort(numbers)















