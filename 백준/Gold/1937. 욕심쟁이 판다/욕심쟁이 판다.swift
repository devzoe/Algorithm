import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(line)
}
var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 1, count: n), count: n)
var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
let direction = [(0,1),(1,0),(-1,0),(0,-1)]
var answer = Int.min
func dfs(_ i: Int, _ j: Int) -> Int {
    visited[i][j] = true
    for d in direction {
        let x = i+d.0
        let y = j+d.1
        if 0 <= x && x < n && 0 <= y && y < n {
            if arr[x][y] > arr[i][j] {
                if !visited[x][y] {
                    dp[i][j] = max(dfs(x,y) + 1,dp[i][j])
                } else {
                    dp[i][j] = max(dp[x][y] + 1,dp[i][j])
                }
            }
        }
    }
    return dp[i][j]
}
for i in 0..<n {
    for j in 0..<n {
        answer = max(dfs(i,j),answer)
    }
}
print(answer)