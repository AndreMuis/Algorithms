//
// Find insert index in sorted array
//

func findInsertIndex(numbers : [Int], start : Int, end: Int, number : Int) -> Int?
{
    if end - start < 0
    {
        return nil
    }
    
    let mid : Int = (start + end) / 2
    
    if numbers[mid] == number
    {
        return mid
    }
    else if number > numbers[mid]
    {
        return findInsertIndex(numbers, start: mid + 1, end: end, number: number)
    }
    else
    {
        return findInsertIndex(numbers, start: start, end: mid - 1, number: number)
    }
}

let numbers : [Int] = [1, 3, 6, 11, 13, 17, 18]

findInsertIndex(numbers, start: 0, end: numbers.count - 1, number: 6)
findInsertIndex(numbers, start: 0, end: numbers.count - 1, number: -10)
findInsertIndex(numbers, start: 0, end: numbers.count - 1, number: -100)




