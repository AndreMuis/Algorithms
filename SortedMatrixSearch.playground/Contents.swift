//
// Find an element in a matrix where each row and column is sorted in ascending order.
//

import Foundation

func findNumber(numbers : [[Int]], number : Int) -> (Int, Int)?
{
    var result : (Int, Int)? = nil
    
    var row : Int = 0
    var column : Int = numbers[0].count - 1
    
    while row < numbers.count && column >= 0
    {
        if number == numbers[row][column]
        {
            result = (row, column)
            break
        }
        else if number < numbers[row][column]
        {
            column -= 1
        }
        else
        {
            row += 1
        }
    }
    
    return result
}


let numbers : [[Int]] =
    [
        [10, 20, 35, 56],
        [12, 23, 37, 62],
        [22, 25, 46, 76],
        [36, 45, 56, 83]
    ]

findNumber(numbers, number: 10)
findNumber(numbers, number: 56)
findNumber(numbers, number: 36)
findNumber(numbers, number: 83)
findNumber(numbers, number: 25)

findNumber(numbers, number: 100)









