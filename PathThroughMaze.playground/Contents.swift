//
// Find a path, if it exists, from the top-left of a maze to the bottom-right with certain
// locations that are inaccessibe
//

import Foundation

func findPath(maze maze : [[Int]], size : (rows : Int, columns : Int), location : (row : Int, column : Int), inout path : [(row : Int, column : Int)]) -> Bool
{
    if location.row > size.rows || location.column > size.columns || maze[location.row - 1][location.column - 1] == 0
    {
        return false
    }
    
    if location == size ||
        findPath(maze: maze, size: size, location: (location.row, location.column + 1), path: &path) ||
        findPath(maze: maze, size: size, location: (location.row + 1, location.column), path: &path)
    {
        path.append(location)
        return true
    }
    
    return false
}


let maze : [[Int]] =
    [
        [1, 1, 1, 1, 0, 0],
        [1, 1, 1, 1, 0, 0],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1]
    ]

let size : (rows : Int, columns : Int) = (6, 6)
let startLocation : (row : Int, column : Int) = (1, 1)
var path : [(row : Int, column : Int)] = [(row : Int, column : Int)]()


findPath(maze: maze, size: size, location: startLocation, path: &path)

print(Array(path.reverse()))













