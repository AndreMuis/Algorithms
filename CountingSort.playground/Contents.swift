//: Playground - noun: a place where people can play

import UIKit


let count : Int = 10

var numbers : [Int] = Array(count: count, repeatedValue: 0)

for i : Int in 0...count - 1
{
    numbers[i] = Int(arc4random() % 5)
}

numbers


var buckets = Array(count: 5, repeatedValue: [Int]())

for number : Int in numbers
{
    buckets[number].append(number)
}




var sortedNumbers : [Int] = []

for bucket : Array in buckets
{
    sortedNumbers += bucket
}

sortedNumbers













