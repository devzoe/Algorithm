import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var dp: [Int] = [Int](repeating: 0, count: n)
dp.indices.forEach { dp[$0] = arr[$0] }
for i in 0..<n {
    for j in 0..<i {
        if arr[j] < arr[i] {
            dp[i] = max(dp[j]+arr[i], dp[i])
        }
    }
}
print(dp.max()!)