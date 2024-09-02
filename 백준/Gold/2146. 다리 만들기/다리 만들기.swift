import Foundation

// Queue
struct Queue<T> {
    private var elements = [T?]()
    private var head = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var count: Int {
        return elements.count - head
    }
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    
    mutating func dequeue() -> T? {
        guard head < elements.count, let element = elements[head] else { return nil }
        elements[head] = nil
        head += 1
        
        if head > elements.count / 2 {
            elements.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    func peek() -> T? {
        if isEmpty {
            return nil
        } else {
            return elements[head]
        }
    }
}

func readInput() -> (Int, [[Int]]) {
    let n = Int(readLine()!)!
    var graph = [[Int]]()
    
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        graph.append(row)
    }
    
    return (n, graph)
}

func bfs(_ i: Int, _ j: Int, n: Int, graph: inout [[Int]], visited: inout [[Int]], num: Int) {
    var queue = Queue<(Int, Int)>()
    queue.enqueue((i, j))
    
    while !queue.isEmpty {
        let (x, y) = queue.dequeue()!
        let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        
        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy
            if nx >= 0 && ny >= 0 && nx < n && ny < n && visited[nx][ny] == 0 && graph[nx][ny] == 1 {
                visited[nx][ny] = 1
                graph[nx][ny] = num
                queue.enqueue((nx, ny))
            }
        }
    }
}

func bfs2(_ v: Int, n: Int, graph: [[Int]]) -> Int {
    var queue = Queue<(Int, Int)>()
    var dist = Array(repeating: Array(repeating: -1, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] == v {
                dist[i][j] = 0
                queue.enqueue((i, j))
            }
        }
    }
    
    let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]
    
    while !queue.isEmpty {
        let (x, y) = queue.dequeue()!
        
        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy
            if nx >= 0 && ny >= 0 && nx < n && ny < n {
                if graph[nx][ny] != 0 && graph[nx][ny] != v {
                    return dist[x][y]
                } else if graph[nx][ny] == 0 && dist[nx][ny] == -1 {
                    dist[nx][ny] = dist[x][y] + 1
                    queue.enqueue((nx, ny))
                }
            }
        }
    }
    
    return Int.max
}

func main() {
    var (n, graph) = readInput()
    var visited = Array(repeating: Array(repeating: 0, count: n), count: n)
    var num = 1
    var res = Int.max
    
    // 섬 구분
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] == 1 && visited[i][j] == 0 {
                visited[i][j] = 1
                graph[i][j] = num
                bfs(i, j, n: n, graph: &graph, visited: &visited, num: num)
                num += 1
            }
        }
    }
    
    // 최단 거리 구하기
    for v in 1..<num {
        res = min(res, bfs2(v, n: n, graph: graph))
    }
    
    print(res)
}

main()
