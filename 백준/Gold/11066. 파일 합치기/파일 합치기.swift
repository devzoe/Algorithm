import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map { Int($0)! }
    var sum = [Int](repeating: 0, count: n+1)
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for i in 1...n {
        sum[i] = sum[i-1]+arr[i-1]
    }
    for z in 1...n {
        for i in 0..<n-z {
            let j = i + z
            dp[i][j] = Int.max
            for k in i..<j {
                dp[i][j] = min(dp[i][j],dp[i][k]+dp[k+1][j]+sum[j+1]-sum[i])
            }
        }
    }
    print(dp[0][n-1])
}