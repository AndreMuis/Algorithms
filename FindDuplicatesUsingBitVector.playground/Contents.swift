//
// With 4 KB of memory find all duplicates in an array of integers with values 1 ... 32000
//

import Foundation

// 4 KB = 4 * 8 * 2^10 bits = 32 * 2^10 bits > 32000

struct BitVector
{
    var words : [Int]
    
    init(size : Int)
    {
        let count : Int = size >> 5 + 1
        
        self.words = Array(count: count, repeatedValue: 0)
    }
    
    func get(bitIndex : Int) -> Bool
    {
        let wordIndex : Int = bitIndex >> 32
        
        let mod32 : Int = 0x1F
        let bitIndexInWord : Int = bitIndex & mod32
        let bitMask : Int = 1 << bitIndexInWord
        
        let bit : Bool = Bool(self.words[wordIndex] & bitMask)
        
        return bit
    }
    
    mutating func set(bitIndex : Int)
    {
        let wordIndex : Int = bitIndex >> 32
        
        let mod32 : Int = 0x1F
        let bitIndexInWord : Int = bitIndex & mod32
        let bitMask : Int = 1 << bitIndexInWord
        
        self.words[wordIndex] |= bitMask
    }
}


let numbers : [Int] = [5, 10, 12, 12, 43, 7, 43]

var bitVector : BitVector = BitVector(size: 32000)

for number in numbers
{
    let bitIndex : Int = number - 1
    
    if bitVector.get(bitIndex) == true
    {
        print(number)
    }
    else
    {
        bitVector.set(bitIndex)
    }
}















