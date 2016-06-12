//
// Implement a stack with a min() method
//

import Foundation

struct Item
{
    init(value : Int)
    {
        self.value = value
        self.min = nil
    }
    
    var value : Int
    var min : Int?
}

struct Stack
{
    private var items : [Item]
    
    init()
    {
        self.items = [Item]()
    }
    
    func allItems() -> [Item]
    {
        return self.items
    }
    
    mutating func push(inout item : Item)
    {
        if self.items.isEmpty == true || item.value < self.min()
        {
            item.min = item.value
        }
        else
        {
            item.min = self.min()
        }
        
        self.items.append(item)
    }
    
    mutating func pop() -> Item
    {
        let item : Item = self.items.removeLast()
        
        return item
    }
    
    mutating func min() -> Int?
    {
        let result : Int? = self.items.last?.min
        
        return result
    }
}

var stack : Stack = Stack()

var item : Item = Item(value: 5)
stack.push(&item)
stack.min()

item = Item(value: 4)
stack.push(&item)
stack.min()

item = Item(value: 10)
stack.push(&item)
stack.min()

stack.pop()
stack.allItems()
stack.min()

stack.pop()
stack.allItems()
stack.min()

stack.pop()
stack.allItems()
stack.min()























