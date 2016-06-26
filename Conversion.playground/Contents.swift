//
// How many bits would you need to flip to convert one integer into another?
//

import Foundation


func convert(first first : UInt8, second : UInt8) -> Int
{
    var combined : UInt8 = first ^ second

    var bitsFlipped : Int = 0
    
    while combined > 0
    {
        if combined & 0b1 == 1
        {
            bitsFlipped += 1
        }
        
        combined >>= 1
    }
    
    return bitsFlipped
}

let first : UInt8 = 0b111111
let second : UInt8 = 0b101100

convert(first: first, second: second)



