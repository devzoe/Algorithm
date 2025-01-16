let direction = [(0,1),(0,-1),(1,0),(-1,0)]
var result = 0
var check = false
var arr: [[String]] = []
var water: [(Int,Int)] = []
var queue: [(Int,Int,Int)] = []
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0],nm[1])
var wVisited: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
for _ in 0..<n {
    let line = readLine()!.map { String($0) }
    arr.append(line)
}
for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == "*" {
            water.append((i,j))
            wVisited[i][j] = 0
        } else if arr[i][j] == "S" {
            queue.append((i,j,0))
            visited[i][j] = true
        }
    }
}

while !water.isEmpty {
    let w = water.removeFirst()
    for d in direction {
        let x = w.0 + d.0
        let y = w.1 + d.1
        if 0 <= x && x < n && 0 <= y && y < m && arr[x][y] != "X" && arr[x][y] != "D" {
            if wVisited[x][y] == -1 {
                wVisited[x][y] = wVisited[w.0][w.1] + 1
                water.append((x,y))
            }
        }
    }
}
loop: while !queue.isEmpty {
    let now = queue.removeFirst()
    let cost = now.2
    for d in direction {
        let x = now.0 + d.0
        let y = now.1 + d.1
        if 0 <= x && x < n && 0 <= y && y < m {
            if arr[x][y] == "." {
                if !visited[x][y] && (wVisited[x][y] > cost+1 || wVisited[x][y] == -1) {
                    visited[x][y] = true
                    queue.append((x,y,cost+1))
                }
            } else if arr[x][y] == "D" {
                check = true
                result = cost+1
                break loop
            }
        }
    }
}
if check {
    print(result)
} else {
    print("KAKTUS")
}