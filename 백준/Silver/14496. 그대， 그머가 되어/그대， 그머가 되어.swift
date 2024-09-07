import Foundation

func bfs(_ start: Int, _ target: Int, _ graph: [[Int]], _ n: Int) -> Int {
    var queue = [(start, 0)]
    var visited = [Bool](repeating: false, count: n + 1)
    visited[start] = true
    
    while !queue.isEmpty {
        let (current, count) = queue.removeFirst()
        
        if current == target {
            return count
        }
        
        for next in graph[current] {
            if !visited[next] {
                visited[next] = true
                queue.append((next, count + 1))
            }
        }
    }
    
    return -1
}

func main() {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let a = firstLine[0]
    let b = firstLine[1]
    
    let secondLine = readLine()!.split(separator: " ").map { Int($0)! }
    let n = secondLine[0]
    let m = secondLine[1]
    
    var graph = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let pair = readLine()!.split(separator: " ").map { Int($0)! }
        let u = pair[0]
        let v = pair[1]

        graph[u].append(v)
        graph[v].append(u)
    }
    
    let result = bfs(a, b, graph, n)
    
    print(result)
}

main()
