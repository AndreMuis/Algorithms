//
// Check if a string is a permutation of a palindrome
//

func isPermutationOfPalindrome(text : String) -> Bool
{
    var map : [Character : Int] = [Character : Int]()
    
    for character in text.characters
    {
        if character >= "a" && character <= "z"
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
    }
    
    var oddCharacterCountOccurences : Int = 0
    
    for (_, count) in map
    {
        if count % 2 == 1
        {
            oddCharacterCountOccurences += 1
        }
    }
    
    
    return oddCharacterCountOccurences <= 1
}


var text = "taco cat"
isPermutationOfPalindrome(text)

text = "cot taac"
isPermutationOfPalindrome(text)

text = "abcdefg"
isPermutationOfPalindrome(text)






