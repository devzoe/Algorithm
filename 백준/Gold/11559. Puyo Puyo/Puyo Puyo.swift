import Foundation

let rows = 12
let cols = 6

let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

func readField() -> [[Character]] {
    var field = [[Character]]()
    for _ in 0..<rows {
        field.append(Array(readLine()!))
    }
    return field
}

func isValid(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < rows && y >= 0 && y < cols
}

func bfs(_ x: Int, _ y: Int, _ color: Character, in field: inout [[Character]]) -> [(Int, Int)] {
    var queue = [(x, y)]
    var index = 0
    var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
    visited[x][y] = true
    var connected = [(Int, Int)]()
    
    while index < queue.count {
        let (cx, cy) = queue[index]
        index += 1
        connected.append((cx, cy))
        
        for (dx, dy) in directions {
            let nx = cx + dx
            let ny = cy + dy
            if isValid(nx, ny) && !visited[nx][ny] && field[nx][ny] == color {
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    
    return connected
}

func applyGravity(to field: inout [[Character]]) {
    for col in 0..<cols {
        var emptyIndex = rows - 1
        for row in stride(from: rows - 1, through: 0, by: -1) {
            if field[row][col] != "." {
                field[emptyIndex][col] = field[row][col]
                if emptyIndex != row {
                    field[row][col] = "."
                }
                emptyIndex -= 1
            }
        }
    }
}

func calculateChains(in field: inout [[Character]]) -> Int {
    var chainCount = 0

    while true {
        var popped = false
        var toPop = [(Int, Int)]()
        
        for x in 0..<rows {
            for y in 0..<cols {
                if field[x][y] != "." {
                    let group = bfs(x, y, field[x][y], in: &field)
                    if group.count >= 4 {
                        toPop.append(contentsOf: group)
                        popped = true
                    }
                }
            }
        }
        
        if popped {
            for (x, y) in toPop {
                field[x][y] = "."
            }
            applyGravity(to: &field)
            chainCount += 1
        } else {
            break
        }
    }

    return chainCount
}

func main() {
    var field = readField()
    let chainCount = calculateChains(in: &field)
    print(chainCount)
}

main()