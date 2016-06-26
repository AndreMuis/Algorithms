//
// Insert a number into a larger number at a certain bit position
//

import Foundation

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

func insertBits(first first : UInt8, second : UInt8, bitStartPosition : UInt8, bitEndPosition : UInt8) -> UInt8
{
    var leftMask : UInt8 = ~0
    leftMask = leftMask << (bitEndPosition + 1)
    
    var rightMask : UInt8 = ~0
    rightMask = rightMask >> (bitStartPosition + bitEndPosition - 1)
    
    let mask : UInt8 = leftMask + rightMask
    
    let firstCleared : UInt8 = first & mask
    let secondShifted : UInt8 = second << bitStartPosition
    
    let result : UInt8 = firstCleared | secondShifted
    
    return result
}

let first : UInt8 = 0b10010100
let second : UInt8 = 0b00001101

let bitStartPosition : UInt8 = 2
let bitEndPosition : UInt8 = 5

let result : UInt8 = insertBits(first: first, second: second, bitStartPosition: bitStartPosition, bitEndPosition: bitEndPosition)

binaryAsString(number: result)


