import Foundation

func dp() -> Int {
    let nk = readLine()!.split(separator: " ").map{ Int($0)! }
    var dp = Array(repeating: 100001, count: 100001)

    if nk[0] >= nk[1] {
        return nk[0] - nk[1]
    }

    for i in 0..<nk[0] {
        dp[i] = nk[0] - i
    }
    
    dp[nk[0]] = 0

    for i in nk[0]+1...nk[1] {
        if i % 2 == 0 {
            dp[i] = min(dp[i/2] + 1, dp[i-1] + 1)
        } else {
            dp[i] = min(dp[i-1] + 1, dp[(i+1)/2] + 2)
        }
    }

    return dp[nk[1]]
}

print(dp())