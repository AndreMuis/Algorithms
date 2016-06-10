//
// Determine if an array contains duplicates
//

func findDuplicate(numbers : [Int]) -> Int?
{
    var map : [Int : Int] = [Int : Int]()
    
    var duplicate : Int? = nil
    
    for number in numbers
    {
        if map[number] == nil
        {
            map[number] = 1
        }
        else
        {
            duplicate = number
            break
        }
    }
    
    return duplicate
}


let numbers : [Int] = [3, 7, 4, 4, 9, 8]

findDuplicate(numbers)


