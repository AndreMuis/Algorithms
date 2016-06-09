
//
// Balanced parentheses
//

func balancedParentheses(text : String) -> Bool
{
    var isBalanced : Bool = true
    
    let brackets : [Character : Character] = ["(" : ")", "[" : "]", "{" : "}"]

    var stack : [Character] = [Character]()
    
    for character in text.characters
    {
        if brackets[character] != nil
        {
            stack.append(character)
        }
        else if let last = stack.last where brackets[last] == character
        {
            stack.removeLast()
        }
        else
        {
            isBalanced = false
        }
    }
    
    if stack.isEmpty == false
    {
        isBalanced = false
    }
    
    return isBalanced
}

var text = "(()[{}])"
balancedParentheses(text)

text = "()("
balancedParentheses(text)











