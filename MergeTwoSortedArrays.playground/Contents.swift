// Merge two sorted arrays


var a : [Int] = [3, 5, 9, 13, 16]
var b : [Int] = [1, 2, 6, 10, 12]

var m : Int = a.count - 1
var n : Int = b.count - 1

a += [0, 0, 0, 0, 0]

while (m >= 0 && n >= 0)
{
    if a[m] > b[n]
    {
        a[m + n + 1] = a[m]
        m -= 1
    }
    else
    {
        a[m + n + 1] = b[n]
        n -= 1
    }
}

while (n >= 0)
{
    a[m + n + 1] = b[n]
    n -= 1
}

a