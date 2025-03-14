import Foundation

let N = Int(readLine()!)!
let ALL = (1 << 10) - 1
let mod = Int(1e9)
var cnt = 0
var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: ALL + 1), count: 10), count: N + 1)

for i in 1..<10 {
    dp[1][i][1 << i] = 1
}

if N > 1 {
    for i in 2...N {
        for j in 0..<10 {
            for k in 0...ALL {
                if j == 0 {
                    dp[i][j][k | (1 << j)] = (dp[i][j][k | (1 << j)] + dp[i - 1][1][k]) % mod
                } else if j == 9 {
                    dp[i][j][k | (1 << j)] = (dp[i][j][k | (1 << j)] + dp[i - 1][8][k]) % mod
                } else {
                    dp[i][j][k | (1 << j)] = (dp[i][j][k | (1 << j)] + dp[i - 1][j - 1][k] + dp[i - 1][j + 1][k]) % mod
                }
            }
        }
    }
}

for i in 0..<10 {
    cnt = (cnt + dp[N][i][ALL]) % mod
}

print(cnt)