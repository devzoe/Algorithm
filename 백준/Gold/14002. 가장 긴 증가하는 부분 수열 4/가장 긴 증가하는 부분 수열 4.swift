import Foundation

let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var dp: [Int] = [Int](repeating: 1, count: n)
dp[0] = 1
for i in 0..<n {
    for j in 0..<i {
        if arr[j] < arr[i] {
            dp[i] = max(dp[j] + 1, dp[i])
        }
    }
}
var m = dp.max()!
print(m)
var idx = Int(dp.firstIndex(of: m)!)
var ans: [Int] = [arr[idx]]
m -= 1
for i in stride(from: idx, through: 0, by: -1) {
    if m == 0 { break }
    if dp[i] == m {
        ans.append(arr[i])
        m -= 1
    }
}
for i in stride(from: ans.count-1, to: -1, by: -1) {
    print(ans[i],terminator: " ")
}