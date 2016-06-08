
// determine if two string are isomorphic


func isIsomorphic(first first : String, second : String) -> Bool
{
    var result : Bool = true

    var map : [String : String] = [String : String]()

    var index = first.startIndex
    
    while (index < first.endIndex)
    {
        let letter1 : String = String(first[index])
        let letter2 : String = String(second[index])

        if map[letter1] != nil
        {
            if map[letter1] != letter2
            {
                result = false
            }
        }
        else
        {
            if map.values.contains(letter2) == false
            {
                map[letter1] = letter2
            }
            else
            {
                result = false
            }
        }
        
        index = index.successor()
    }
    
    return result
}

var first : String = "egg"
var second : String = "add"

isIsomorphic(first: first, second: second)


first = "food"
second = "tape"

isIsomorphic(first: first, second: second)




