//: Playground - noun: a place where people can play

import Foundation


let lines = 6

var numbers = Array(count: lines, repeatedValue: Array(count: lines, repeatedValue: 0))

for line in 0..<lines
{
    for count in 0...line
    {
        if count == 0 || count == line
        {
            numbers[line][count] = 1
        }
        else
        {
            numbers[line][count] = numbers[line - 1][count - 1] + numbers[line - 1][count]
        }
        
        print("\(numbers[line][count])", separator: "", terminator: " ")
    }
    
    print()
}


