import Foundation

func readInput() -> (Int, [[Int]]) {
    let N = Int(readLine()!)!
    var map: [[Int]] = []
    for _ in 0..<N {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        map.append(line)
    }
    return (N, map)
}

func DP( _ N: Int, _ map: [[Int]]) {
    var dp: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: N), count: N), count: 3)
    dp[0][0][1] = 1
    for i in 0..<N {
        for j in 1..<N {
            if map[i][j] == 0 {
                if i == 0 {
                    if j > 1 {
                        dp[0][i][j] = dp[0][i][j-1]
                    }
                } else {
                        dp[0][i][j] = dp[0][i][j-1] + dp[2][i][j-1]
                        dp[1][i][j] = dp[1][i-1][j] + dp[2][i-1][j]
                    if map[i-1][j] == 0 && map[i][j-1] == 0 {
                        dp[2][i][j] = dp[0][i-1][j-1] + dp[1][i-1][j-1] + dp[2][i-1][j-1]
                    }
                }
            }
        }
    }
    print(dp[0][N-1][N-1]+dp[1][N-1][N-1]+dp[2][N-1][N-1])
}

func main() {
    let (N, map) = readInput()
    DP(N,map)
    
}
main()