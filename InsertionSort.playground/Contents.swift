//: Playground - noun: a place where people can play

import Foundation


// O(count^2)

let count : Int = 10

var numbers : [Int] = Array(count: count, repeatedValue: 0)

for i : Int in 0...count - 1
{
    numbers[i] = Int(arc4random() % 100 + 1)
}

numbers

for key : Int in 1...count - 1
{
    for j in (1...key).reverse()
    {
        if numbers[j] < numbers[j - 1]
        {
            swap(&numbers[j], &numbers[j - 1])
        }
    }
}

numbers

