import Foundation

let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var minValue = Int.max
var result: (Int,Int) = (0,0)
func binarySearch(_ left: Int, _ right: Int, _ target: Int, _ targetIdx: Int) {
    var left = left
    var right = right
    while left <= right {
        let mid = (left+right)/2
        if mid >= n { break }
        
        if 0 <= target - arr[mid] {
            left = mid + 1
        } else {
            right = mid - 1
        }
        if minValue > abs(target-arr[mid]) {
            minValue = abs(target-arr[mid])
            result = (-target, arr[mid])
        }
    }
}

for i in 0..<n-1 {
    binarySearch(i+1, n, -arr[i], i)
}

print(result.0,result.1)