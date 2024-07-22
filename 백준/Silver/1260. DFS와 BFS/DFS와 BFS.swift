import Foundation

func readInput() -> (Int, Int, Int, [[Int]]) {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let N = firstLine[0]
    let M = firstLine[1]
    let V = firstLine[2]
    
    var graph = [[Int]](repeating: [], count: N + 1)

    for _ in 0..<M {
        let relation = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = relation[0]
        let b = relation[1]
        graph[a].append(b)
        graph[b].append(a)
    }
    
    for i in 1...N {
        graph[i].sort()
    }
    
    return (N, M, V, graph)
}

func dfs(node: Int, graph: [[Int]], visited: inout [Bool]) {
    visited[node] = true
    print(node, terminator: " ")
    
    for nextNode in graph[node] {
        if !visited[nextNode] {
            dfs(node: nextNode, graph: graph, visited: &visited)
        }
    }
}

func bfs(startNode: Int, graph: [[Int]], visited: inout [Bool]) {
    var queue = [startNode]
    var index = 0
    visited[startNode] = true
    
    while index < queue.count {
        let currentNode = queue[index]
        print(currentNode, terminator: " ")
        
        for nextNode in graph[currentNode] {
            if !visited[nextNode] {
                visited[nextNode] = true
                queue.append(nextNode)
            }
        }
        index += 1
    }
}

let (N, M, V, graph) = readInput()

var visited = [Bool](repeating: false, count: N + 1)
dfs(node: V, graph: graph, visited: &visited)
print()

visited = [Bool](repeating: false, count: N + 1)
bfs(startNode: V, graph: graph, visited: &visited)
print()
