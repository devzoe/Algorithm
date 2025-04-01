let n = Int(readLine()!)!
var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
dp[0][0] = Int(readLine()!)!
for i in 1..<n {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0...i {
        if j == 0 {
            dp[i][j] = arr[j] + dp[i-1][j]
        } else if j == i {
            dp[i][j] = arr[j] + dp[i-1][j-1]
        } else {
            dp[i][j] = max(arr[j]+dp[i-1][j-1], arr[j]+dp[i-1][j])
        }
    }
}
print(dp[n-1].max()!)