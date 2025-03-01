import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let ne = readLine()!.split(separator: " ").map { Int($0)! }
    let (node, edge) = (ne[0], ne[1])
    var graph: [[Int]] = [[Int]](repeating: [], count: node)
    for _ in 0..<edge {
        let e = readLine()!.split(separator: " ").map { Int($0)! }
        graph[e[0]-1].append(e[1]-1)
        graph[e[1]-1].append(e[0]-1)
    }
    var bipartite: [Int] = [Int](repeating: -1, count: node)
    var visited: [Bool] = [Bool](repeating: false, count: node)
    func bfs(_ curr: Int) -> Bool{
        var queue: [(Int,Int)] = [(curr,0)]
        visited[curr] = true
        bipartite[curr] = 0
        while !queue.isEmpty {
            let (currentNode, currentValue) = queue.removeFirst()
            for i in graph[currentNode] {
                if !visited[i] {
                    visited[i] = true
                    if currentValue == 0 { bipartite[i] = 1 }
                    else { bipartite[i] = 0 }
                    queue.append((i,bipartite[i]))
                } else {
                    if bipartite[i] == currentValue {
                        return false
                    }
                }
            }
        }
        return true
    }
    var result = "YES"
    for i in 0..<node {
        if !visited[i] {
            if !bfs(i) {
                result = "NO"
                break
            }
        }
    }
    print(result)
}