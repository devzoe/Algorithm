import Foundation

func readInput() -> (Int, Int, [[Int]]) {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    let V = line[0], E = line[1]
    
    var dp = Array(repeating: Array(repeating: Int.max, count: V+1), count: V+1)
    for _ in 0..<E {
        let q = readLine()!.split(separator: " ").map{Int(String($0))!}
        dp[q[0]][q[1]] = q[2]
    }
    return (V, E, dp)
}

func solution(V: Int, E: Int, dp: inout [[Int]]) {
    for k in 1...V {
        for i in 1...V {
            for j in 1...V {
                if dp[i][k] == Int.max || dp[k][j] == Int.max { continue }
                dp[i][j] = min(dp[i][j], dp[i][k]+dp[k][j])
            }
        }
    }

    var answer = Int.max
    for i in 1...V {
        answer = min(answer, dp[i][i])
    }
    print(answer == Int.max ? -1 : answer)
}

let (V, E, dp) = readInput()
var dpCopied = dp
solution(V: V, E: E, dp: &dpCopied)