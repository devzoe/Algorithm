import Foundation

func solution(_ str1: String, _ str2: String) -> Int {
    let m = str1.count
    let n = str2.count
    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    let str1Array = Array(str1)
    let str2Array = Array(str2)
    
    for i in 1...m {
        for j in 1...n {
            if str1Array[i - 1] == str2Array[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
            }
        }
    }
    return dp[m][n]
}

let str1 = readLine()!
let str2 = readLine()!
print(solution(str1, str2))
