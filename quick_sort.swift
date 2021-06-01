import Foundation
import Glibc

var arr = [12, 0, 3, 9, 2, 18, 8, 27, 5, 1, 21]
var length  = 0
func sort(inputArr: [Int])
{

    if (inputArr.count == 0)
    {
        print("finished")
        return
    }

    arr = inputArr
    length = arr.count
    quicksort(low:0,high:length-1)

}

func quicksort(low: Int, high: Int)
{
    var i = low
    var j = high

    let piv = (low + (high - low) / 2)
    let pivot_location = arr[piv]

    print("----")

    while i <= j
    {
        while arr[i] < pivot_location
        {
            i+=1
        }
        while arr[j] > pivot_location
        {
            j-=1
        }

        if i <= j
        {
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp

            i+=1
            j-=1
        }
    }

    print(arr)

    if low < j
    {
        quicksort(low: low, high: j)
    }
    if i < high
    {
        quicksort(low: i, high: high)
    }
}

print(arr)
sort(inputArr: arr)
print(arr)
