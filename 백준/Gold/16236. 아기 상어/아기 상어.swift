import Foundation

let n = Int(readLine()!)!
var map: [[Int]] = []
var shark = (x: 0, y: 0)
var sharkSize = 2
var eatCount = 0
var totalTime = 0
let dx = [-1, 0, 0, 1]
let dy = [0, -1, 1, 0]

for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(row)
    for j in 0..<n {
        if row[j] == 9 {
            shark = (i, j)
            map[i][j] = 0
        }
    }
}

func bfs() -> (x: Int, y: Int, dist: Int)? {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var distMap = Array(repeating: Array(repeating: 0, count: n), count: n)
    var queue = [(shark.x, shark.y)]
    visited[shark.x][shark.y] = true
    var edible: [(x: Int, y: Int, dist: Int)] = []
    
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        for dir in 0..<4 {
            let nx = x + dx[dir]
            let ny = y + dy[dir]
            if nx >= 0, ny >= 0, nx < n, ny < n, !visited[nx][ny], map[nx][ny] <= sharkSize {
                visited[nx][ny] = true
                distMap[nx][ny] = distMap[x][y] + 1
                queue.append((nx, ny))
                
                if map[nx][ny] != 0, map[nx][ny] < sharkSize {
                    edible.append((nx, ny, distMap[nx][ny]))
                }
            }
        }
    }
    
    if edible.isEmpty { return nil }
    
    edible.sort {
        if $0.dist == $1.dist {
            if $0.x == $1.x {
                return $0.y < $1.y
            } else {
                return $0.x < $1.x
            }
        }
        return $0.dist < $1.dist
    }
    
    return edible.first
}

while let next = bfs() {
    totalTime += next.dist
    shark = (next.x, next.y)
    map[next.x][next.y] = 0
    eatCount += 1
    if eatCount == sharkSize {
        sharkSize += 1
        eatCount = 0
    }
}

print(totalTime)