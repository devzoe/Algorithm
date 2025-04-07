let t = Int(readLine()!)!

for _ in 0..<t {
    let nmw = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,m,w) = (nmw[0],nmw[1],nmw[2])
    var graph: [(Int,Int,Int)] = []
    var costs: [Int] = [Int](repeating: 0, count: n+1)
    var timeTravel = false
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        graph.append((edge[0],edge[1],edge[2]))
        graph.append((edge[1],edge[0],edge[2]))
    }
    for _ in 0..<w {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        graph.append((edge[0],edge[1],-edge[2]))
    }
    
    func bellmanFord() -> Bool {
        for i in 1...n {
            for now in graph {
                let (currNode, nextNode, edgeCost) = now
                if costs[currNode] + edgeCost < costs[nextNode] {
                    costs[nextNode] = costs[currNode] + edgeCost
                    
                    if i == n {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    if bellmanFord() { timeTravel = true }

    timeTravel ? print("YES") : print("NO")
}