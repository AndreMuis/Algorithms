//
// In a sorted array of distinct nunbers find the index where the value at that index  
// equals the index
//

import Foundation

func findMagicIndex(numbers numbers : [Int], startIndex : Int, endIndex : Int) -> Int
{
    var result : Int
    
    if (startIndex > endIndex)
    {
        result = -1
    }
    else
    {
        let middleIndex : Int = (endIndex + startIndex) / 2

        if numbers[middleIndex] == middleIndex
        {
            result = middleIndex
        }
        else if numbers[middleIndex] < middleIndex
        {
            result = findMagicIndex(numbers: numbers, startIndex: middleIndex + 1, endIndex: endIndex)
        }
        else
        {
            result = findMagicIndex(numbers: numbers, startIndex: startIndex, endIndex: middleIndex - 1)
        }
    }
    
    return result
}


let numbers : [Int] = [-3, -2, 2, 3, 5, 10, 11, 23, 32]

findMagicIndex(numbers: numbers, startIndex: 0, endIndex: numbers.count - 1)


