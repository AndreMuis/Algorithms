//
// Swap the even and odd bits in an integer
//

import Foundation

func pairwiseSwap(number : UInt8) -> UInt8
{
    let evenMask : UInt8 = 0b01010101
    let oddMask : UInt8 = 0b10101010

    let evenShifted = (number & evenMask) << 1
    let oddShifted = (number & oddMask) >> 1
    
    let result : UInt8 = evenShifted | oddShifted
    
    return result
}

func binaryAsString(number number : UInt8) -> String
{
    let unpadded : String = String(number, radix: 2)
    
    var padded : String = unpadded
    
    for _ in 0 ..< 8 - unpadded.characters.count
    {
        padded = "0" + padded
    }
    
    return padded
}


let number : UInt8 = 0b11001001

let result : UInt8 = pairwiseSwap(number)

binaryAsString(number: result)




