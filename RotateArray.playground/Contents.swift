
// Rotate an array to the right


let numbers = [1, 2, 3, 4, 5, 6, 7]

let steps = 3

let first = numbers[0 ..< numbers.count - steps]

let last = numbers[numbers.count - steps ..< numbers.count]

let result = last + first

