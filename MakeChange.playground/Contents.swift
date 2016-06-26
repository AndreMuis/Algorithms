//
// How many different ways can change be made using quarters, dimes, nickels and pennies?
//

import Foundation


func makeChange(amount amount : Int, denominationList : [Int], denominationIndex : Int) -> Int
{
    var ways : Int = 0
    
    if denominationIndex >= denominationList.count - 1
    {
        ways = 1
    }
    else
    {
        let denomination : Int = denominationList[denominationIndex]
    
        for count in 0 ... amount / denomination
        {
            ways += makeChange(amount: amount - count * denomination, denominationList: denominationList, denominationIndex: denominationIndex + 1)
        }
    }
    
    return ways
}


let denominationList : [Int] = [25, 10, 5, 1]
let denominationIndex = 0

makeChange(amount: 1, denominationList: denominationList, denominationIndex: denominationIndex)
makeChange(amount: 2, denominationList: denominationList, denominationIndex: denominationIndex)
makeChange(amount: 3, denominationList: denominationList, denominationIndex: denominationIndex)
makeChange(amount: 5, denominationList: denominationList, denominationIndex: denominationIndex)
makeChange(amount: 6, denominationList: denominationList, denominationIndex: denominationIndex)
makeChange(amount: 10, denominationList: denominationList, denominationIndex: denominationIndex)














