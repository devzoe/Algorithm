import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0],nm[1])
var arr: [[Int]] = []
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(line)
}
var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
let direction = [(0,-1),(-1,0),(0,1),(1,0)]
func dfs(_ i: Int, _ j: Int) -> Int {
    for d in direction {
        let x = i+d.0
        let y = j+d.1
        if 0 <= x && x < n && 0 <= y && y < m && arr[x][y] < arr[i][j] {
            if !visited[x][y] {
                visited[x][y] = true
                dp[i][j] += dfs(x,y)
            } else {
                dp[i][j] += dp[x][y]
            }
        }
    }
    return dp[i][j]
}
dp[n-1][m-1] = 1
print(dfs(0,0))