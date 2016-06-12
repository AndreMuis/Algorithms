//
// Is a string a rotation of another string?
//

import Foundation

func isText(text : String, aRotationOf rotated: String) -> Bool
{
    let rotatedRotated : String = rotated + rotated
    
    var result : Bool = false
        
    if rotatedRotated.rangeOfString(text) != nil
    {
        result = true
    }
    
    return result
}

var text : String = "carport"
var rotatedText : String = "portcar"

isText(text, aRotationOf: rotatedText)


text = "abc"
rotatedText = "xyz"

isText(text, aRotationOf: rotatedText)

