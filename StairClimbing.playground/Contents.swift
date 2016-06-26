//
// A child can climb a set of stairs by takinbg 1, 2 or 3 steps at a time.
// How man ways can the child climb the stairs?
//

func countPaths(stair stair : Int, stairs : Int) -> Int
{
    var paths : Int
    
    if stair > stairs
    {
        paths = 0
    }
    else if stair == stairs
    {
        paths = 1
    }
    else
    {
        paths = countPaths(stair: stair + 1, stairs: stairs) +
            countPaths(stair: stair + 2, stairs: stairs) +
            countPaths(stair: stair + 3, stairs: stairs)
    }
    
    return paths
}


let startStair : Int = 1

countPaths(stair: startStair, stairs: 2)
countPaths(stair: startStair, stairs: 3)
countPaths(stair: startStair, stairs: 4)


