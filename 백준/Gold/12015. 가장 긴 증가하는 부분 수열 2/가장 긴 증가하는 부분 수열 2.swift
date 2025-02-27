import Foundation

let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
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
var j = 0
lis[0] = arr[0]
for i in 1..<n {
    if lis[j] < arr[i] {
        lis[j+1] = arr[i]
        j += 1
    } else {
        let idx = binarySearch(0, j, arr[i])
        lis[idx] = arr[i]
    }
}
print(j+1)