import Foundation

func readInput() -> (Int, [[Int]]) {
    let n = Int(readLine()!)!
    let v = Int(readLine()!)!
    var graph = [[Int]](repeating: [], count: n + 1)

    for _ in 0..<v {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        let a = edge[0], b = edge[1]
        graph[a].append(b)
        graph[b].append(a)
    }
    return (n, graph)
}

func dfs(v: Int, graph: [[Int]], visited: inout [Int]) {
    visited[v] = 1
    for nx in graph[v] {
        if visited[nx] == 0 {
            dfs(v: nx, graph: graph, visited: &visited)
        }
    }
}

let (n, graph) = readInput()
var visited = [Int](repeating: 0, count: n + 1)
dfs(v: 1, graph: graph, visited: &visited)
print(visited.reduce(0, +) - 1)