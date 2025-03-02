import Foundation
 
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph: [[(Int,Int)]] = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 0..<m {
    let v = readLine()!.split(separator: " ").map { Int($0)!}
    graph[v[0]].append((v[1],v[2]))
}
graph.indices.forEach { graph[$0].sort { $0.1 < $1.1 }}
let v = readLine()!.split(separator: " ").map { Int($0)!}
let (s,e) = (v[0],v[1])
var dp: [Int] = [Int](repeating: Int.max, count: n+1)
var queue = [s]
dp[s] = 0
var i = 0

while i < queue.count {
    let node = queue[i]
    let cost = dp[node]
    for next in graph[node] {
        if dp[next.0] > cost+next.1 {
            dp[next.0] = cost+next.1
            queue.append(next.0)
        }
    }
    i += 1
}
print(dp[e])