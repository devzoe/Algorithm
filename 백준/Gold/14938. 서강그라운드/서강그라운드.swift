let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,r) = (nmr[0],nmr[1],nmr[2])
let items = readLine()!.split(separator: " ").map { Int($0)! }
var graph: [[(Int,Int)]] = [[(Int,Int)]](repeating: [], count: n+1)
var costs: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: n+1), count: n+1)
var maxItem = 0

for _ in 0..<r {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    graph[edge[0]].append((edge[1],edge[2]))
    graph[edge[1]].append((edge[0],edge[2]))
}

for i in 1...n {
    costs[i][i] = 0
    var queue = [(i,0)]
    while !queue.isEmpty {
        let (curr,cost) = queue.removeFirst()
        for next in graph[curr] {
            let nextNode = next.0
            let nextCost = next.1
            if nextCost + cost < costs[i][nextNode] {
                costs[i][nextNode] = nextCost + cost
                queue.append((nextNode,nextCost+cost))
            }
        }
    }
}

for i in 1...n {
    var cost = 0
    for j in 1...n {
        if costs[i][j] <= m {
            cost += items[j-1]
        }
    }
    maxItem = max(maxItem, cost)
}

print(maxItem)