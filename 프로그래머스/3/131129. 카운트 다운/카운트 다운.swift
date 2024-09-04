import Foundation

func solution(_ target: Int) -> [Int] {
    var answer = [Int](repeating: 0, count: 2)
    var dp = Array(repeating: [Int](repeating: 0, count: 2), count: max(61, target + 1))
                        
    // 1부터 20까지 싱글, 더블, 트리플 계산
    for i in 1...20 {
        dp[i][0] = 1
        dp[i][1] = 1
        if dp[i * 2][0] != 1 {
            dp[i * 2][0] = 1
        }
        if dp[i * 3][0] != 1 {
            dp[i * 3][0] = 1
        }
    }
    
    // 불(50점) 설정
    dp[50][0] = 1
    dp[50][1] = 1
    
    // 23부터 60까지
    for i in 23...60 {
        if dp[i][0] == 0 {
            dp[i][0] = 2
            for j in 1...20 {
                if dp[i - j][0] + 1 <= dp[i][0] {
                    dp[i][1] = max(dp[i - j][1] + 1, dp[i][1])
                }
            }
        }
    }
    
    // 60보다 큰 경우
    if target > 60 {
        for i in 61...target {
            if dp[i - 60][0] > dp[i - 50][0] {
                dp[i][0] = dp[i - 50][0] + 1
                dp[i][1] = dp[i - 50][1] + 1
            } else if dp[i - 60][0] < dp[i - 50][0] {
                dp[i][0] = dp[i - 60][0] + 1
                dp[i][1] = dp[i - 60][1]
            } else {
                dp[i][0] = dp[i - 50][0] + 1
                dp[i][1] = max(dp[i - 60][1], dp[i - 50][1] + 1)
            }
        }
    }

    return dp[target]
}