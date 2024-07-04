import Foundation

struct Position: Hashable {
    let row: Int
    let col: Int
    let brokenWall: Int
}

let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

func isValid(_ row: Int, _ col: Int, _ n: Int, _ m: Int) -> Bool {
    return row >= 0 && row < n && col >= 0 && col < m
}

func shortestPath(_ map: [[Int]], _ n: Int, _ m: Int) -> Int {
    var queue = [(row: Int, col: Int, brokenWall: Int, steps: Int)]()
    var front = 0
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)
    
    queue.append((row: 0, col: 0, brokenWall: 0, steps: 1))
    visited[0][0][0] = true
    
    while front < queue.count {
        let current = queue[front]
        front += 1
        
        if current.row == n - 1 && current.col == m - 1 {
            return current.steps
        }
        
        for direction in directions {
            let newRow = current.row + direction.0
            let newCol = current.col + direction.1
            
            if isValid(newRow, newCol, n, m) {
                if map[newRow][newCol] == 0 && !visited[newRow][newCol][current.brokenWall] {
                    queue.append((row: newRow, col: newCol, brokenWall: current.brokenWall, steps: current.steps + 1))
                    visited[newRow][newCol][current.brokenWall] = true
                } else if map[newRow][newCol] == 1 && current.brokenWall == 0 && !visited[newRow][newCol][1] {
                    queue.append((row: newRow, col: newCol, brokenWall: 1, steps: current.steps + 1))
                    visited[newRow][newCol][1] = true
                }
            }
        }
    }
    
    return -1
}

if let input = readLine() {
    let dimensions = input.split(separator: " ").map { Int($0)! }
    let n = dimensions[0]
    let m = dimensions[1]
    
    var map = [[Int]]()
    
    for _ in 0..<n {
        if let line = readLine() {
            let row = line.map { Int(String($0))! }
            map.append(row)
        }
    }
    
    let result = shortestPath(map, n, m)
    print(result)
}
