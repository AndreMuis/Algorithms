//
// An animal shelter has only dogs and cats. 
// Only the oldest dog or cat can be adopted.
// If no preference is specified the oldest animal will be given.
//

import Foundation

struct Animal
{
    let name : String
    let type : String
    var arrivalOrder : Int?

    init(name : String, type : String)
    {
        self.name = name
        self.type = type
        self.arrivalOrder = nil
    }
}

struct AnimalQueue
{
    private var animals : [Animal]
    
    var isEmpty : Bool
    {
        return self.animals.isEmpty
    }
    
    init()
    {
        self.animals = [Animal]()
    }
    
    func peek() -> Animal?
    {
        let animal : Animal? = self.animals.first
        
        return animal
    }
    
    mutating func enqueue(animal : Animal)
    {
        self.animals.append(animal)
    }
    
    mutating func dequeue() -> Animal
    {
        let animal : Animal = self.animals.removeFirst()
        
        return animal
    }
}

struct AnimalShelter
{
    var catQueue : AnimalQueue
    var dogQueue : AnimalQueue
    var arrivalOrder : Int
    
    init()
    {
        self.catQueue = AnimalQueue()
        self.dogQueue = AnimalQueue()
        self.arrivalOrder = 1
    }
    
    mutating func enqueue(inout animal : Animal)
    {
        animal.arrivalOrder = self.arrivalOrder
        
        if animal.type == "cat"
        {
            self.catQueue.enqueue(animal)
        }
        else if animal.type == "dog"
        {
            self.dogQueue.enqueue(animal)
        }
        
        self.arrivalOrder += 1
    }
    
    mutating func dequeueCat() -> Animal
    {
        let cat : Animal = self.catQueue.dequeue()
        
        return cat
    }
    
    mutating func dequeueDog() -> Animal
    {
        let dog : Animal = self.dogQueue.dequeue()
        
        return dog
    }
    
    mutating func dequeueAny() -> Animal
    {
        var animal : Animal?
        
        if self.catQueue.isEmpty == true
        {
            animal = self.dogQueue.dequeue()
        }
        else if self.dogQueue.isEmpty == true
        {
            animal = self.catQueue.dequeue()
        }
        else if let cat = self.catQueue.peek(),
            let dog = self.dogQueue.peek()
        {
            if cat.arrivalOrder < dog.arrivalOrder
            {
                animal = self.catQueue.dequeue()
            }
            else
            {
                animal = self.dogQueue.dequeue()
            }
        }
        
        return animal!
    }
}


var animalShelter : AnimalShelter = AnimalShelter()

var animal : Animal = Animal(name: "Fred", type: "dog")
animalShelter.enqueue(&animal)

animal = Animal(name: "Whiskers", type: "cat")
animalShelter.enqueue(&animal)

animal = Animal(name: "Fido", type: "dog")
animalShelter.enqueue(&animal)

animal = Animal(name: "Scooby", type: "dog")
animalShelter.enqueue(&animal)

animal = Animal(name: "Garfield", type: "cat")
animalShelter.enqueue(&animal)


animal = animalShelter.dequeueCat()
animal.name

animal = animalShelter.dequeueDog()
animal.name

animal = animalShelter.dequeueCat()
animal.name

animal = animalShelter.dequeueAny()
animal.name

animal = animalShelter.dequeueAny()
animal.name

















