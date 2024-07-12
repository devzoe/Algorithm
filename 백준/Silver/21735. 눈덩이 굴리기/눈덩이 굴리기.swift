import Foundation

func readInput() -> (Int, Int, [Int]) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let N = line[0]
    let M = line[1]
    
    let snow = readLine()!.split(separator: " ").map { Int($0)! }

    return (N, M, snow)
}

func createSnow(N: Int, M: Int, snowAmounts: [Int]) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)  
    dp[0][0] = 1
    for time in 0..<M {
        for position in 0...N {
            let currentSize = dp[position][time]
            if currentSize == 0 {
                continue
            }
            
            // 현재 위치에서 +1
            if position + 1 <= N {
                dp[position + 1][time + 1] = max(dp[position + 1][time + 1], currentSize + snowAmounts[position])
            }
            // 현재 위치에서 +2
            if position + 2 <= N {
                dp[position + 2][time + 1] = max(dp[position + 2][time + 1], currentSize / 2 + snowAmounts[position + 1])
            }
        }
    }
    
    var maxSnowman = 0
    for time in 0...M {
        for position in 0...N {
            maxSnowman = max(maxSnowman, dp[position][time])
        }
    }
    return maxSnowman
}

let (N, M, snow) = readInput()
let result = createSnow(N: N, M: M, snowAmounts: snow)
print(result)
