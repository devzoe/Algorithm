func readInput() -> (Int, Int, Int, [[Int]]) {
    let line = readLine()!.split(separator: " ").map{ Int($0)! }
    let node = line[0], edge = line[1], startNode = line[2]
    var graph: [[Int]] = [[Int]](repeating: [], count: node+1)
    for _ in 0..<edge {
        let line = readLine()!.split(separator: " ").map{ Int($0)! }
        let a = line[0], b = line[1]
        graph[a].append(b)
        graph[b].append(a)
        graph[a].sort()
        graph[b].sort()
    }
    return (node, edge, startNode, graph)
}

func dfs(_ curr: Int, _ graph: [[Int]], _ visited: inout [Bool], _ result: inout [Int]) {
    result.append(curr)
    visited[curr] = true
    for next in graph[curr] {
        if !visited[next] {
            dfs(next, graph, &visited, &result)
        }
    }
}

func bfs(_ curr: Int, _ graph: [[Int]], _ visited: inout [Bool], _ result: inout [Int]) {
    var queue: [Int] = [curr]
    result.append(curr)
    visited[curr] = true
    while !queue.isEmpty {
        let now = queue.removeFirst()
        for next in graph[now] {
            if !visited[next] {
                result.append(next)
                visited[next] = true
                queue.append(next)
            }
        }
    }
}

func main() {
    let (node, edge, startNode, graph) = readInput()
    var visited: [Bool] = [Bool](repeating: false, count: node+1)
    var result: [Int] = []
    
    dfs(startNode, graph, &visited, &result)
    result.forEach { print($0, terminator: " ")}
    print()
    visited = [Bool](repeating: false, count: node+1)
    result = []
    bfs(startNode, graph, &visited, &result)
    result.forEach { print($0, terminator: " ")}
}

main()
