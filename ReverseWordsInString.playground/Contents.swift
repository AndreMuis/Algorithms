
// reverse words in a string


var line : String  = "first second third"

let words : [String] = line.characters.split(" ").map(String.init)

let result : [String] = Array(words.reverse())


