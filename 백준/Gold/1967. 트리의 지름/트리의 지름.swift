let n = Int(readLine()!)!
var tree: [[(Int,Int)]] = [[(Int,Int)]](repeating: [], count: n+1)
var parent: [Int] = [Int](repeating: 0, count: n+1)
var leaf: [Int] = []
var visited: [Bool] = [Bool](repeating: false, count: n+1)
var cost: [Int] = [Int](repeating: 0, count: n+1)
var maxCost = 0

for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    tree[edge[0]].append((edge[1],edge[2]))
    parent[edge[1]] = edge[0]
}

func dfs(_ currNode: Int, _ currCost: Int) {
    for next in tree[currNode] {
        let nextNode = next.0
        let nextCost = next.1
        if !visited[nextNode] {
            visited[nextNode] = true
            cost[nextNode] = currCost + nextCost
            if tree[nextNode].isEmpty {
                maxCost = max(maxCost,cost[nextNode])
                leaf.append(nextNode)
            }
            dfs(nextNode,currCost + nextCost)
        }
    }
}

visited[1] = true
dfs(1, 0)

for i in 0..<leaf.count {
    for j in i+1..<leaf.count {
        var parent1 = parent[leaf[i]]
        loop: while parent1 != 1 {
            var parent2 = leaf[j]
            while parent2 != 1 {
                parent2 = parent[parent2]
                if parent1 == parent2 {
                    break loop
                }
            }
            parent1 = parent[parent1]
        }
        maxCost = max(maxCost, cost[leaf[i]]+cost[leaf[j]]-2*cost[parent1])
    }
}
print(maxCost)