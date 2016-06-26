//
// Find all valid combinations of parentheses
//

import Foundation

func getCombinations(inout combinationList : [String], combination : String, leftRemaining : Int, rightRemaining : Int)
{
    if leftRemaining < 0 || rightRemaining < 0 || rightRemaining < leftRemaining
    {
        return
    }
    
    if leftRemaining == 0 && rightRemaining == 0
    {
        combinationList.append(combination)
    }
    else
    {
        let combination1 = combination + "("
        getCombinations(&combinationList, combination: combination1, leftRemaining: leftRemaining - 1, rightRemaining: rightRemaining)

        let combination2 = combination + ")"
        getCombinations(&combinationList, combination: combination2, leftRemaining: leftRemaining, rightRemaining: rightRemaining - 1)
    }
}


for pairs in 1 ... 3
{
    var combinationList : [String] = [String]()

    getCombinations(&combinationList, combination: "", leftRemaining: pairs, rightRemaining: pairs)

    for combination : String in combinationList
    {
        print(combination)
    }
    
    print()
}








