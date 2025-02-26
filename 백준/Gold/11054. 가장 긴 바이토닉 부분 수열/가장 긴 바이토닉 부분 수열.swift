import Foundation

let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var dp1: [Int] = [Int](repeating: 1, count: n)
var dp2: [Int] = [Int](repeating: 1, count: n)
for i in 0..<n {
    for j in 0..<i {
        if arr[j] < arr[i] {
            dp1[i] = max(dp1[j]+1,dp1[i])
        }
        if arr[n-1-j] < arr[n-1-i] {
            dp2[n-1-i] = max(dp2[n-1-j]+1,dp2[n-1-i])
        }
    }
}
var answer = Int.min
for i in 0..<n {
    answer = max(answer, dp1[i]+dp2[i]-1)
}
print(answer)