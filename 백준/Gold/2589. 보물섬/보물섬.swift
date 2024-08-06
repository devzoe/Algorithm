import Foundation

func readInput() -> (Int, Int, [[Character]]) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let row = line[0], col = line[1]
    var map = [[Character]]()
    for _ in 0..<row {
        let line = readLine()!
        map.append(Array(line))
    }
    return (row, col, map)
}

func boundary(_ i: Int, _ j: Int, _ row: Int, _ col: Int) -> Bool {
    return (0 <= i && i < row) && (0 <= j && j < col)
}
    
func bfs(_ i: Int, _ j: Int, _ row: Int, _ col: Int, _ result: inout Int, _ map: [[Character]]) {
    var q = [[i, j]]
    var visited = Array(repeating: Array(repeating: 0, count: col), count: row)
    let d = [[-1,0], [1,0], [0,-1], [0,1]]
    visited[i][j] = 1
    
    while !q.isEmpty {
        let data = q.removeFirst()
        let i = data[0], j = data[1]
        for k in d {
            let ni = i + k[0], nj = j + k[1]
            if !boundary(ni, nj, row, col) || visited[ni][nj] != 0 {
                continue
            }
            if map[ni][nj] == "L" {
                visited[ni][nj] = visited[i][j] + 1
                result = result < visited[i][j] ? visited[i][j] : result
                q.append([ni, nj])
                continue
            }
        }
    }
}

let (row, col, map) = readInput()
var result = 0
for i in 0..<row {
    for j in 0..<col {
        if map[i][j] == "W" {
            continue
        }
        bfs(i, j, row, col, &result, map)
    }
}
print(result)