import Foundation

let nrq = readLine()!.split(separator: " ").map { Int($0)! }
let (n,root,query) = (nrq[0],nrq[1],nrq[2])
var tree: [[Int]] = Array(repeating: [], count: n+1)
var nodeCnt: [Int] = Array(repeating: 0, count: n+1)
var visited: [Bool] = Array(repeating: false, count: n+1)
visited[root] = true

for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    tree[edge[0]].append(edge[1])
    tree[edge[1]].append(edge[0])
    
}

func callNode(_ node: Int) -> Int {
    for next in tree[node] {
        if !visited[next] {
            visited[next] = true
            nodeCnt[node] += 1
            nodeCnt[node] += callNode(next)
        }
    }
    return nodeCnt[node]
}

callNode(root)

for _ in 0..<query {
    let q = Int(readLine()!)!
    print(nodeCnt[q]+1)
}