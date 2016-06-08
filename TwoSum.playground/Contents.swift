// Two Sum


var sum = 13

var numbers : [Int] = [8, 12, 5, 2, 3]

func twoSum(numbers numbers : [Int], sum : Int) -> (Int?, Int?)
{
    var indexes : (Int?, Int?) = (nil, nil)
    
    var map : [Int : Int] = [Int : Int]()
    
    for i in 0 ..< numbers.count
    {
        if map[numbers[i]] != nil
        {
            indexes = (map[numbers[i]], i)
        }
        else
        {
           map[sum - numbers[i]] = i
        }
    }

    return indexes
}

twoSum(numbers: numbers, sum: sum)




