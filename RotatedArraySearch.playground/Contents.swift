//
// Find a number in a sorted array that has been rotated.
//

import Foundation

func findNumber(number : Int, numbers : [Int], start : Int, end : Int) -> Int?
{
    let mid : Int = (end + start) / 2
    
    if number == numbers[mid]
    {
        return mid
    }
    
    if end < start
    {
        return nil
    }
    
    if numbers[start] < numbers[mid]
    {
        if number >= numbers[start] && number < numbers[mid]
        {
            return findNumber(number, numbers: numbers, start: start, end: mid - 1)
        }
        else
        {
            return findNumber(number, numbers: numbers, start: mid + 1, end: end)
        }
    }
    else if numbers[end] > numbers[mid]
    {
        if number > numbers[mid] && number <= numbers[end]
        {
            return findNumber(number, numbers: numbers, start: mid + 1, end: end)
        }
        else
        {
            return findNumber(number, numbers: numbers, start: start, end: mid - 1)
        }
    }
    else
    {
        if numbers[mid] == numbers[start]
        {
            if numbers[mid] != numbers[end]
            {
                return findNumber(number, numbers: numbers, start: mid + 1, end: end)
            }
            else
            {
                if let result = findNumber(number, numbers: numbers, start: start, end: mid - 1)
                {
                    return result
                }
                else
                {
                    return findNumber(number, numbers: numbers, start: mid + 1, end: end)
                }
            }
        }
    }
    
    return nil
}


var numbers : [Int] = [10, 11, 13, 2, 3, 7, 8, 9]

findNumber(10, numbers: numbers, start: 0, end: numbers.count - 1)
findNumber(13, numbers: numbers, start: 0, end: numbers.count - 1)
findNumber(2, numbers: numbers, start: 0, end: numbers.count - 1)
findNumber(9, numbers: numbers, start: 0, end: numbers.count - 1)
findNumber(100, numbers: numbers, start: 0, end: numbers.count - 1)


numbers = [2, 2, 2, 3, 4]

findNumber(2, numbers: numbers, start: 0, end: numbers.count - 1)
findNumber(3, numbers: numbers, start: 0, end: numbers.count - 1)
findNumber(100, numbers: numbers, start: 0, end: numbers.count - 1)


numbers = [2, 2, 2, 2, 2]

findNumber(2, numbers: numbers, start: 0, end: numbers.count - 1)
findNumber(100, numbers: numbers, start: 0, end: numbers.count - 1)








