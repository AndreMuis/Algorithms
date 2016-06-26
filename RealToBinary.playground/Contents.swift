//
// Given a real number between 0 and 1 convert it to a binary number as a string
//

import Foundation

func binaryAsString(number number : Float) -> String
{
    var number = number
    
    var fraction : Float = 0.5
    
    var result : String = "0."
    
    while (number > 0.0)
    {
        if (number >= fraction)
        {
            result += "1"
            number -= fraction
        }
        else
        {
            result += "0"
        }
        
        if result.characters.count > 10
        {
            print(result)
            
            result = "ERROR"
            break
        }
        
        fraction /= 2
    }
    
    return result
}

binaryAsString(number: 0.5)
binaryAsString(number: 0.25)
binaryAsString(number: 0.125)

binaryAsString(number: 0.875)

binaryAsString(number: 0.333)













