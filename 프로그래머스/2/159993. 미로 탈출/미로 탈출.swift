import Foundation

// 큐
struct Queue<T> {
    private var elements: [T] = []
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
}

func solution(_ maps: [String]) -> Int {
    let n = maps.count
    let m = maps[0].count
    var charMaps = maps.map { Array($0) }
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)
    let directions: [(Int, Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var queue = Queue<(Int, Int, Bool, Int)>()
    
    for i in 0..<n {
        for j in 0..<m {
            if charMaps[i][j] == "S" {
                queue.enqueue((i, j, false, 0))
                visited[i][j][0] = true
            }
        }
    }
    
    while !queue.isEmpty {
        let (y, x, passedL, steps) = queue.dequeue()!
        
        if charMaps[y][x] == "E" && passedL {
            return steps
        }
        
        for direction in directions {
            let ny = y + direction.0
            let nx = x + direction.1
            
            if ny >= 0, ny < n, nx >= 0, nx < m, charMaps[ny][nx] != "X", !visited[ny][nx][passedL ? 1 : 0] {
                let nextPassedL = passedL || charMaps[ny][nx] == "L"
                visited[ny][nx][nextPassedL ? 1 : 0] = true
                queue.enqueue((ny, nx, nextPassedL, steps + 1))
            }
        }
    }
    
    return -1
}