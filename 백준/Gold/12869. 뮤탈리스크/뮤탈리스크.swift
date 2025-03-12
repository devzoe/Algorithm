import Foundation

let n = Int(readLine()!)!
let scv = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [[[Int]]](repeating:[[Int]](repeating:[Int](repeating: 0, count: 64),count: 64),count: 64)
var visited = [[[Int]]](repeating:[[Int]](repeating:[Int](repeating: 0, count: 64),count: 64),count: 64)
var dmg = [[9, 3, 1], [9, 1, 3], [3, 1, 9], [3, 9, 1], [1, 3, 9], [1, 9, 3]]
var q: [(Int,Int,Int)] = []

var arr : [Int] = [Int](repeating: 0, count: 3)
scv.indices.forEach { arr[$0] = scv[$0] }

visited[arr[0]][arr[1]][arr[2]] = 1
q.append((arr[0], arr[1], arr[2]))
while !q.isEmpty {
    let (a,b,c) = q.removeFirst()
    for i in 0..<6 {
        let na = max(0, a - dmg[i][0])
        let nb = max(0, b - dmg[i][1])
        let nc = max(0, c - dmg[i][2])
        if visited[na][nb][nc] != 0 { continue }
        visited[na][nb][nc] = visited[a][b][c] + 1
        q.append((na, nb, nc))
    }
}

print(visited[0][0][0] - 1)