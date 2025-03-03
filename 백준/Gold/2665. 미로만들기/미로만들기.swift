import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<n {
    let line = readLine()!.map { Int(String($0))! }
    arr.append(line)
}
let direction = [(0,1),(1,0),(0,-1),(-1,0)]
var queue: [(Int,Int,Int)] = [(0,0,0)]
var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var dp: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
dp[0][0] = 0

while !queue.isEmpty {
    let (x,y,cost) = queue.removeFirst()
    if x == n-1 && y == n-1 { break }
    visited[x][y] = true
    for d in direction {
        let nextX = x+d.0
        let nextY = y+d.1
        if 0 <= nextX && nextX < n && 0 <= nextY && nextY < n && !visited[nextX][nextY] && dp[nextX][nextY] > cost {
            var c = 0
            if arr[nextX][nextY] == 1 {
                c = cost
            } else {
                c = cost+1
            }
            visited[nextX][nextY] = true
            dp[nextX][nextY] = c
            queue.append((nextX,nextY,c))
            queue.sort { $0.2 < $1.2 }
        }
    }
}

print(dp[n-1][n-1])