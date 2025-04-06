let nmx = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,x) = (nmx[0],nmx[1],nmx[2])
var graph: [[(Int,Int)]] = [[(Int,Int)]](repeating: [], count: n+1)
var costs: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: n+1), count: n+1)
var maxCost = 0

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    graph[edge[0]].append((edge[1],edge[2]))
}
costs.indices.forEach { costs[$0][$0] = 0 }

for i in 1...n {
    var queue: [(Int,Int)] = [(i,0)]
    var idx = 0
    loop: while idx < queue.count {
        let (currNode, currCost) = queue[idx]
        for next in graph[currNode] {
            let nextNode = next.0
            let nextCost = next.1
            if costs[i][nextNode] > currCost + nextCost {
                costs[i][nextNode] = currCost + nextCost
                queue.append((nextNode, currCost + nextCost))
            }
        }
        idx += 1
    }
}
(1...n).forEach {
    maxCost = max(maxCost, costs[$0][x]+costs[x][$0])
}
print(maxCost)