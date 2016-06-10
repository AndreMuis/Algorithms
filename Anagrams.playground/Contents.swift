//
//
//


func isWord(first : String, anagramOfWord second: String) -> Bool
{
    var map : [Character : Int] = [Character : Int]()
    
    for character in first.characters
    {
        if let count = map[character]
        {
            map[character] = count + 1
        }
        else
        {
            map[character] = 1
        }
    }
    
    for character in second.characters
    {
        if let count = map[character]
        {
            map[character] = count - 1
            
            if map[character] == 0
            {
                map[character] = nil
            }
        }
    }
    
    return map.isEmpty
}


var first : String = "race"
var second : String = "care"

isWord(first, anagramOfWord: second)


first = "foam"
second = "crop"

isWord(first, anagramOfWord: second)








