import Foundation

func readInput() -> [[Character]] {
    var graph = [[Character]]()
    for _ in 0..<12 {
        if let line = readLine() {
            graph.append(Array(line))
        }
    }
    return graph
}

func check(x: Int, y: Int, graph: inout [[Character]], visited: inout [[Bool]], bombList: inout [(Int, Int)]) {
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var queue = [(x, y)]
    let currentColor = graph[x][y]
    var positions = [(Int, Int)]()
    positions.append((x, y))
    visited[x][y] = true

    while !queue.isEmpty {
        let (cx, cy) = queue.removeFirst()
        for i in 0..<4 {
            let nx = cx + dx[i]
            let ny = cy + dy[i]
            if nx >= 0 && nx < 12 && ny >= 0 && ny < 6 {
                if graph[nx][ny] == currentColor && !visited[nx][ny] {
                    positions.append((nx, ny))
                    queue.append((nx, ny))
                    visited[nx][ny] = true
                }
            }
        }
    }

    if positions.count >= 4 {
        for (i, j) in positions {
            graph[i][j] = "_"
            bombList.append((i, j))
        }
    }
}

func main() {
    var graph = readInput()
    var time = 0
    
    while true {
        var visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
        var bombList = [(Int, Int)]()
        
        for i in 0..<12 {
            for j in 0..<6 {
                if graph[i][j] != "." && graph[i][j] != "_" && !visited[i][j] {
                    check(x: i, y: j, graph: &graph, visited: &visited, bombList: &bombList)
                }
            }
        }
        
        if bombList.isEmpty {
            break
        }
        
        for y in 0..<6 {
            var stack = [Character]()
            for x in stride(from: 11, through: 0, by: -1) {
                if graph[x][y] != "." && graph[x][y] != "_" {
                    stack.append(graph[x][y])
                }
            }
            for x in stride(from: 11, through: 0, by: -1) {
                if !stack.isEmpty {
                    graph[x][y] = stack.removeFirst()
                } else {
                    graph[x][y] = "."
                }
            }
        }
        
        time += 1
    }
    
    print(time)
}

main()