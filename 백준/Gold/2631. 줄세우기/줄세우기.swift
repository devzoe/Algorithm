import Foundation

let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    let m = Int(readLine()!)!
    arr.append(m)
}
var dp: [Int] = [Int](repeating: 1, count: n)
for i in 1..<n {
    for j in 0..<i {
        if arr[j] < arr[i] {
            dp[i] = max(dp[j]+1,dp[i])
        }
    }
}
print(n-dp.max()!)