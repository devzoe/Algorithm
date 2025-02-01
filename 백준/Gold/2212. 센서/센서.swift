import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
if n == 1 { print(0) }
else {
    arr.sort()
    var result: [Int] = []
    for i in 0..<n-1 {
        result.append(arr[i+1]-arr[i])
    }
    result.sort()
    var ans = 0
    for i in 0..<n-k {
        ans += result[i]
    }
    print(ans)
}