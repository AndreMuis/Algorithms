//
// Implement a queue via stacks
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


struct Queue
{
    var newestStack : Stack
    var oldestStack : Stack
    
    init()
    {
        self.newestStack = Stack()
        self.oldestStack = Stack()
    }
    
    mutating func enqueue(number : Int)
    {
        self.newestStack.push(number)
    }
    
    mutating func peek() -> Int?
    {
        self.moveNewestToOldest()
        
        let number : Int? = self.oldestStack.peek()
        
        return number
    }
    
    mutating func dequeue() -> Int
    {
        self.moveNewestToOldest()

        let number : Int = self.oldestStack.pop()

        return number
    }
    
    mutating func moveNewestToOldest()
    {
        if self.oldestStack.isEmpty == true
        {
            while self.newestStack.isEmpty == false
            {
                self.oldestStack.push(self.newestStack.pop())
            }
        }
    }
}


var queue : Queue = Queue()

queue.enqueue(1)
queue.enqueue(2)
queue.peek()

queue.enqueue(3)
queue.enqueue(4)
queue.peek()

queue.dequeue()
queue.dequeue()

queue.enqueue(5)

queue.dequeue()
queue.dequeue()
queue.dequeue()









