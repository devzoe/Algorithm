import Foundation

func readMaze() -> ([[Int]], Int, Int) {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    
    var maze = [[Int]]()
    for _ in 0..<n {
        maze.append(Array(readLine()!).map { Int(String($0))! })
    }
    
    return (maze, n, m)
}

func bfs(maze: [[Int]], n: Int, m: Int) -> Int {
    let directions = [(0, -1), (-1, 0), (0, 1), (1, 0)]
    var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
    visited[0][0] = 1
    
    var queue = [(0, 0)]
    var front = 0
    
    while front < queue.count {
        let (x, y) = queue[front]
        front += 1
        
        if x == n - 1 && y == m - 1 {
            return visited[x][y]
        }
        
        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy
            
            if nx >= 0 && nx < n && ny >= 0 && ny < m && maze[nx][ny] == 1 && visited[nx][ny] == 0 {
                visited[nx][ny] = visited[x][y] + 1
                queue.append((nx, ny))
            }
        }
    }
    
    return -1 
}

func solveMaze() -> Int {
    let (maze, n, m) = readMaze()
    return bfs(maze: maze, n: n, m: m)
}

let result = solveMaze()
print(result)
