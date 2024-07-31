import Foundation

func solution(N: Int) -> String {
    var result = ""
    var dp = [Int](repeating: 0, count: N+1)
    for i in 1...N {
        if i % 3 == 0 {
            dp[i] = dp[i-3] + 1
        } else {
            dp[i] = dp[i-1] + 1
        }
    }
    if dp[N] % 2 == 0 {
        result = "CY"
    } else {
        result = "SK"
    }
    return result
}

let N = Int(readLine()!)!
let result = solution(N: N)
print(result)
