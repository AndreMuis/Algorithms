//: Playground - noun: a place where people can play

import UIKit


extension Character
{
    var codePoint : UInt32
    {
        let result : UInt32 = String(self).unicodeScalars.first!.value
        return result
    }
}

func powi(base : UInt32, _ power : UInt32) -> UInt32
{
    let result = UInt32(pow(Float(base), Float(power)))
    
    return result
}


let aCodePoint : UInt32 = Character("a").codePoint
let zCodePoint : UInt32 = Character("z").codePoint

let base : UInt32 = zCodePoint - aCodePoint + 1


let wordLength : UInt32 = 3


struct RollingHash
{
    var text : String
    var value : UInt32
    
    init(text : String)
    {
        self.text = text
        self.value = 0

        var index = text.endIndex

        while (index > text.startIndex)
        {
            index = index.predecessor()
            
            let character : Character = text[index]
            
            let power : Int = index.distanceTo(text.endIndex) - 1
            
            self.value += (character.codePoint - aCodePoint) * powi(base, UInt32(power))
        }
    }
    
    mutating func append(new : Character)
    {
        let old : Character = self.text.removeAtIndex(self.text.startIndex)
        
        self.value = base * (self.value - (old.codePoint - aCodePoint) * powi(base, wordLength - 1))
            + (new.codePoint - aCodePoint) * powi(base, 0)
        
        self.text += String(new)
    }
}



func findMatches(text text : String, searchText : String) -> Int
{
    let searchHash : RollingHash = RollingHash(text: searchText)
    

    let range : Range = text.startIndex ..< text.startIndex.advancedBy(Int(wordLength))
    
    var hash : RollingHash = RollingHash(text: text[range])
    
    
    var matches : Int = 0

    var index = text.startIndex.advancedBy(Int(wordLength))
    
    while (index < text.endIndex.predecessor())
    {
        if (hash.value == searchHash.value)
        {
            matches = matches + 1
        }
        
        index = index.successor()
        
        hash.append(text[index])
    }
    
    return matches
}


findMatches(text: "thefoxjumpedoverthecow", searchText: "the")

findMatches(text: "thefoxjumpedoverthecow", searchText: "and")










