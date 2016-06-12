//
// Sort a stack using a second stack
//

import Foundation

struct Stack
{
    private var numbers : [Int]
    
    var isEmpty : Bool
    {
        return self.numbers.isEmpty
    }
    
    init()
    {
        self.numbers = [Int]()
    }
    
    func allItems() -> [Int]
    {
        return self.numbers
    }
    
    func peek() -> Int?
    {
        let number : Int? = self.numbers.last
        
        return number
    }
    
    mutating func push(number : Int)
    {
        self.numbers.append(number)
    }
    
    mutating func pop() -> Int
    {
        let number : Int = self.numbers.removeLast()
        
        return number
    }
}


func sortStack(inout stack : Stack)
{
    var helperStack : Stack = Stack()
    var temp : Int = 0

    while stack.isEmpty == false
    {
        temp = stack.pop()
        
        while helperStack.isEmpty == false && temp > helperStack.peek()
        {
            stack.push(helperStack.pop())
        }
        
        helperStack.push(temp)
    }
    
    while helperStack.isEmpty == false
    {
        stack.push(helperStack.pop())
    }
}

var stack : Stack = Stack()
stack.push(5)
stack.push(7)
stack.push(3)
stack.push(17)
stack.push(11)

stack.allItems()

sortStack(&stack)

stack.allItems()











