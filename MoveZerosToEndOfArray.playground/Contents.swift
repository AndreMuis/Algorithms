//
// Move zeros to end of array
//


func moveZeros(inout numbers : [Int])
{
    var index : Int = 0
    var swapIndex : Int = 0
    
    while index < numbers.count - 1
    {
        if numbers[index] == 0 && numbers[index + 1] != 0
        {
            let tmp : Int = numbers[swapIndex]
            numbers[swapIndex] = numbers[index + 1]
            numbers[index + 1] = tmp
            
            swapIndex = swapIndex + 1
        }
        
        index = index + 1
    }
}


var numbers : [Int] = [0, 4, 3, 0, 0, 7, 5]

moveZeros(&numbers)

numbers


