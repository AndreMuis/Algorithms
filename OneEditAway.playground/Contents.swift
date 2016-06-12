//
// Check if one string is one edit (insertion, removal, replacement) away from another string
//

import Foundation

func oneEditAway(first first : String, second : String) -> Bool
{
    var oneAway : Bool = false
    
    if first.characters.count == second.characters.count
    {
        oneAway = oneReplacementAway(string1: first, string2: second)
    }
    else if first.characters.count == second.characters.count + 1
    {
        oneAway = oneInsertAway(string1: second, string2: first)
    }
    else if first.characters.count + 1 == second.characters.count
    {
        oneAway = oneInsertAway(string1: first, string2: second)
    }
    
    return oneAway
}

func oneReplacementAway(string1 string1 : String, string2 : String) -> Bool
{
    var index : String.CharacterView.Index = string1.startIndex
    
    var nonMatchingCharactersCount = 0
    
    while index < string1.endIndex
    {
        if string1[index] != string2[index]
        {
            nonMatchingCharactersCount += 1
        }
        
        index = index.successor()
    }
    
    return nonMatchingCharactersCount == 1
}

func oneInsertAway(string1 string1 : String, string2 : String) -> Bool
{
    var index1 : String.CharacterView.Index = string1.startIndex
    var index2 : String.CharacterView.Index = string2.startIndex
    
    var oneAway : Bool = false
    
    while index1 < string1.endIndex && index2 < string2.endIndex
    {
        if (string1[index1] == string2[index2])
        {
            index1 = index1.successor()
            index2 = index2.successor()
        }
        else
        {
            if (index1 == index2)
            {
                oneAway = true
                index2 = index2.successor()
            }
            else
            {
                oneAway = false
                break
            }
        }
    }
    
    return oneAway
}

var first : String = "cart"
var second : String = "bart"
oneEditAway(first: first, second: second)

first = "brain"
second = "bran"
oneEditAway(first: first, second: second)

first = "favor"
second = "flavor"
oneEditAway(first: first, second: second)


first = "abcdefg"
second = "abcdefg"
oneEditAway(first: first, second: second)

first = "abcdefg"
second = "abxdefx"
oneEditAway(first: first, second: second)

first = "abcdefg"
second = "abcdefgxx"
oneEditAway(first: first, second: second)

first = "abcdefg"
second = "abcde"
oneEditAway(first: first, second: second)













