let t = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<t {
    arr.append(Int(readLine()!)!)
}
var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 4), count: arr.max()!+1)
dp[1][1] = 1
dp[2][1] = 1
dp[2][2] = 1
dp[3][1] = 1
dp[3][2] = 1
dp[3][3] = 1

for i in 4...arr.max()! {
    dp[i][1] = dp[i-1][1];
    dp[i][2] = dp[i-2][1] + dp[i-2][2];
    dp[i][3] = dp[i-3][1] + dp[i-3][2] + dp[i-3][3];
}

for i in arr {
    print(dp[i][1] + dp[i][2] + dp[i][3])
}