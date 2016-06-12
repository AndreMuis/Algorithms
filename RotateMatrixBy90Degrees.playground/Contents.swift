//
// Rotate an NxN matrix by 90 degrees
//

func rotateMatrixby90Degrees(inout matrix : [[Int]])
{
    let matrixLength : Int = matrix[0].count
    
    for layer in 0 ..< matrixLength / 2
    {
        let first : Int = layer
        let last : Int = (matrixLength - 1) - layer
        
        for index in first ..< last
        {
            let offset : Int = index - first
            
            let temp = matrix[first][index]
            matrix[first][index] = matrix[last - offset][first]
            matrix[last - offset][first] = matrix[last][last - offset]
            matrix[last][last - offset] = matrix[index][last]
            matrix[index][last] = temp
       }
    }
}


var matrix : [[Int]] =
    [
        [1, 2, 3, 4, 5],
        [1, 2, 3, 4, 5],
        [1, 2, 3, 4, 5],
        [1, 2, 3, 4, 5],
        [1, 2, 3, 4, 5]
    ]

rotateMatrixby90Degrees(&matrix)

for array in matrix
{
    print(array)
}
