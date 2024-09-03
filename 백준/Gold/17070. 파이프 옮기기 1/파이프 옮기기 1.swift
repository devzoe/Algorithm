
import Foundation

func readInput() -> (Int, [[Int]]) {
    let N = Int(readLine()!)!
    var board: [[Int]] = [[Int]]()
    for _ in 0..<N {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        board.append(line)
    }
    return (N, board)
}

func movePipe(_ N: Int, _ board: [[Int]]) -> Int {
    var dp: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: N), count: N), count: 3)
    dp[0][0][1] = 1
    for i in 2..<N {
        if board[0][i] == 0 {
            dp[0][0][i] = dp[0][0][i-1]
        }
    }
    for i in 1..<N {
        for j in 1..<N {
            if board[i][j] == 0 && board[i][j-1] == 0 && board[i-1][j] == 0 {
                dp[1][i][j] = dp[0][i-1][j-1] + dp[1][i-1][j-1] + dp[2][i-1][j-1]
            }
            
            if board[i][j] == 0 {
                dp[0][i][j] = dp[0][i][j-1] + dp[1][i][j-1]
                dp[2][i][j] = dp[2][i-1][j] + dp[1][i-1][j]
            }
        }
    }
    var sum = 0
    for i in 0..<3 {
        sum += dp[i][N-1][N-1]
    }
    return sum
}

func main() {
    let (N, board) = readInput()
    print(movePipe(N, board))
}

main()