import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []
var arr2: [Int] = []
var dp: [Int] = [Int](repeating: 1, count: n)

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(line)
}
arr.sort { $0[0] < $1[0] }
arr.forEach { arr2.append($0[1])}
dp[0] = 1
for i in 0..<n {
    for j in 0..<i {
        if arr2[j] < arr2[i] {
            dp[i] = max(dp[j] + 1,dp[i])
        }
    }
}
print(n-dp.max()!)