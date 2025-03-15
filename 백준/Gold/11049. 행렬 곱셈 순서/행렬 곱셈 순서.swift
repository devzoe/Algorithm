import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for z in 1...n {
    for i in 0..<n-z {
        let j = i + z
        dp[i][j] = Int.max
        for k in i..<j {
            dp[i][j] = min(dp[i][j],dp[i][k]+dp[k+1][j]+arr[i][0]*arr[k][1]*arr[j][1])
        }
        
    }
}

print(dp[0][n-1])