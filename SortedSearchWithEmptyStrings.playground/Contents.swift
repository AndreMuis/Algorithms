//
// Find the index of some text in an array that can contain empty strings
//

import Foundation

func findText(text : String, textList : [String], start : Int, end : Int) -> Int?
{
    if start > end
    {
        return nil
    }
    
    var mid : Int = (start + end) / 2
    
    if textList[mid] == ""
    {
        var left : Int = mid - 1
        var right : Int = mid + 1
        
        while true
        {
            if left < start && right > end
            {
                return nil
            }
            else if left >= start && textList[left] != ""
            {
                mid = left
                break
            }
            else if right <= end && textList[right] != ""
            {
                mid = right
                break
            }
            
            left -= 1
            right += 1
        }
    }
    
    if text == textList[mid]
    {
        return mid
    }
    else if text < textList[mid]
    {
        return findText(text, textList: textList, start: start, end: mid - 1)
    }
    else if text > textList[mid]
    {
        return findText(text, textList: textList, start: mid + 1, end: end)
    }

    return nil
}


let textList = ["cat", "", "dog", "", "", "", "", "phone", ""]

findText("cat", textList: textList, start: 0, end: textList.count - 1)
findText("dog", textList: textList, start: 0, end: textList.count - 1)
findText("phone", textList: textList, start: 0, end: textList.count - 1)
findText("rabbit", textList: textList, start: 0, end: textList.count - 1)









