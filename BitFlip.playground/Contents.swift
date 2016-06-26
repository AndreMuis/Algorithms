//
// Find the longest binary sequence of 1's by flipping one bit in an integer from 0 to 1
//

import Foundation

func bitFlip(number : UInt16) -> Int
{
    var someNumber : UInt16 = number
    
    var previousOnesCount : Int = 0
    var currentOnesCount : Int = 0
    var maxOnesCount : Int = 0
    
    while someNumber > 0
    {
        if someNumber & 0b1 == 1
        {
            currentOnesCount += 1
        }
        else if someNumber & 0b1 == 0
        {
            if someNumber & 0b10 == 0
            {
                previousOnesCount = 0
                currentOnesCount = 0
            }
            else if someNumber & 0b10 == 1
            {
                previousOnesCount = currentOnesCount
                currentOnesCount = 0
            }
        }
        
        maxOnesCount = max(previousOnesCount + currentOnesCount + 1, maxOnesCount)
        
        someNumber >>= 1
    }
    
    return maxOnesCount
}


var number : UInt16 = 0b0000000000000101
bitFlip(number)

number = 0b0111011001101100
bitFlip(number)
















