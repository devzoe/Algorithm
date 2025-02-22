import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var lis: [Int] = [Int](repeating: 0, count: n)

func binarySearch(_ left: Int, _ right: Int, _ target: Int) -> Int {
    var l = left
    var r = right
    while l < r {
        let mid = (l+r)/2
        if lis[mid] < target {
            l = mid + 1
        } else {
            r = mid
        }
    }
    return r
}

var maxL = 0
lis[0] = arr[0]
var i = 1
while i < n {
    if lis[maxL] < arr[i] {
        lis[maxL+1] = arr[i]
        maxL += 1
    } else {
        let idx = binarySearch(0, maxL, arr[i])
        lis[idx] = arr[i]
    }
    i += 1
}
print(maxL+1)