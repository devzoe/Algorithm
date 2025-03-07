import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph: [[(Int,Int)]] = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 0..<m {
    let e = readLine()!.split(separator: " ").map { Int($0)! }
    if e[0] == e[1] { continue }
    graph[e[0]].append((e[1],e[2]))
    graph[e[1]].append((e[0],e[2]))
}

var queue: [(Int,Int)] = [(1,0)]
var dist: [Int] = [Int](repeating: Int.max, count: n+1)
var visited: [Bool] = [Bool](repeating: false, count: n+1)
visited[1] = true
dist[1] = 0
while !queue.isEmpty {
    let (node,cost) = queue.removeFirst()
    visited[node] = true
    for next in graph[node] {
        if !visited[next.0] && dist[next.0] > next.1 {
            dist[next.0] = next.1
            queue.append((next.0,next.1))
        }
    }
    queue.sort { $0.1 < $1.1 }
}
print(dist.filter { $0 != Int.max }.reduce(0,+))