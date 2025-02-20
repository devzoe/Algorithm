import Foundation

var n = 0
var flag = false
var graph = [[String]]()
var teachers = [[Int]]()

func bfs() -> Bool {
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    for t in teachers {
        for k in 0..<4 {
            var nx = t[0]
            var ny = t[1]
            while nx >= 0 && nx < n && ny >= 0 && ny < n {
                if graph[nx][ny] == "O" {
                    break
                }
                if graph[nx][ny] == "S" {
                    return false
                }
                nx += dx[k]
                ny += dy[k]
            }
        }
    }
    return true
}

func backtracking(cnt: Int) {
    if flag { return }
    if cnt == 3 {
        if bfs() {
            flag = true
        }
        return
    }
    
    for x in 0..<n {
        for y in 0..<n {
            if graph[x][y] == "X" {
                graph[x][y] = "O"
                backtracking(cnt: cnt + 1)
                graph[x][y] = "X"
            }
        }
    }
}

let size = Int(readLine()!)!
n = size
for i in 0..<n {
    let row = readLine()!.components(separatedBy: " ")
    graph.append(row)
    for j in 0..<row.count {
        if row[j] == "T" {
            teachers.append([i, j])
        }
    }
}

backtracking(cnt: 0)
print(flag ? "YES" : "NO")