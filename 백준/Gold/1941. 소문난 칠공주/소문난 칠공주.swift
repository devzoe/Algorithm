func readInput() -> [[Character]] {
    var map = [[Character]]()
    for _ in 0..<5 {
        let line = readLine()!.map { $0 }
        map.append(line)
    }
    return map
}

func isValid(x: Int, y: Int, N: Int) -> Bool {
    return x >= 0 && x < N && y >= 0 && y < N
}

func bfs(_ N: Int, _ totalCount: Int, _ map: [[Character]]) -> Bool {
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var queue = [(Int, Int)]()
    var sCount = 0
    var count = 0
    var tempVisited = Array(repeating: Array(repeating: false, count: N), count: N)

    let (startX, startY) = selected[0]
    queue.append((startX, startY))
    tempVisited[startX][startY] = true
    count += 1
    if map[startX][startY] == "S" {
        sCount += 1
    }
    
    var index = 0
    while index < queue.count {
        let (x, y) = queue[index]
        index += 1
        
        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy
            
            if isValid(x: nx, y: ny, N: N) && !tempVisited[nx][ny] && visited[nx][ny] {
                tempVisited[nx][ny] = true
                queue.append((nx, ny))
                count += 1
                if map[nx][ny] == "S" {
                    sCount += 1
                }
            }
        }
    }
    
    return count == totalCount && sCount >= 4
}

func dfs(_ idx: Int, _ depth: Int, _ N: Int, _ totalCount: Int, _ map: [[Character]]) {
    if depth == totalCount {
        if bfs(N, totalCount, map) {
            answer += 1
        }
        return
    }
    
    for i in idx..<N*N {
        let x = i / N
        let y = i % N
        
        if !visited[x][y] {
            visited[x][y] = true
            selected.append((x, y))
            dfs(i + 1, depth + 1, N, totalCount, map)
            selected.removeLast()
            visited[x][y] = false
        }
    }
}

let N = 5
let totalCount = 7
var answer = 0
var selected: [(Int, Int)] = []
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
let map = readInput()
                    
dfs(0, 0, N, totalCount, map)
print(answer)