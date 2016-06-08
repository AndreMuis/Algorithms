
// Find the kth largest element in an array

let k : Int = 3

var numbers : [Int] = [4, 5, 3, 1, 2]

numbers = numbers.sort({$0 > $1})

numbers[k - 1]






