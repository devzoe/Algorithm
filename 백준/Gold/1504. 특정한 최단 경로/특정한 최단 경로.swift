import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0],nm[1])
var graph: [[(Int,Int)]] = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 0..<m {
    let e = readLine()!.split(separator: " ").map { Int($0)! }
    graph[e[0]].append((e[1],e[2]))
    graph[e[1]].append((e[0],e[2]))
}
let v = readLine()!.split(separator: " ").map { Int($0)! }

func bfs(_ s: Int) -> [Int] {
    var dp: [Int] = [Int](repeating: Int.max, count: n+1)
    var queue: [(Int,Int)] = [(s,0)]
    dp[s] = 0
    while !queue.isEmpty {
        let (node, weight) = queue.removeFirst()
        if weight > dp[node] { continue }
        for next in graph[node]{
            let w = weight + next.1
            if w < dp[next.0] {
                dp[next.0] = w
                queue.append((next.0,w))
            }
        }
        queue.sort { $0.1 < $1.1}
    }
    return dp
}
let a = bfs(1)
let b = bfs(v[0])
let c = bfs(v[1])

if [a[v[0]],b[v[1]],c[n]].contains(Int.max) && [a[v[1]],c[v[0]],b[n]].contains(Int.max) {
    print(-1)
} else if [a[v[0]],b[v[1]],c[n]].contains(Int.max) {
    print(a[v[1]]+c[v[0]]+b[n])
} else if [a[v[1]],c[v[0]],b[n]].contains(Int.max) {
    print(a[v[0]]+b[v[1]]+c[n])
} else {
    print(min(a[v[0]]+b[v[1]]+c[n],a[v[1]]+c[v[0]]+b[n]))
}