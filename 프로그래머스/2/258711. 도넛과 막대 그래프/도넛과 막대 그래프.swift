import Foundation

func solution(_ edges: [[Int]]) -> [Int] {
    var indeg = [Int: Int]()      // 진입 차수
    var outdeg = [Int: Int]()     // 진출 차수
    var vis = Set<Int>()          // 방문한 노드 집합
    var adj = [Int: [Int]]()      // 인접 리스트
    for e in edges {
        let u = e[0]
        let v = e[1]
        outdeg[u, default: 0] += 1
        indeg[v, default: 0] += 1
        adj[u, default: []].append(v)
    }
    // 모든 노드 집합
    let nodes = Set(adj.keys).union(indeg.keys).union(outdeg.keys)
    
    func centerNode() -> Int {
        var cNode = -1
        for node in nodes {
            let inDegree = indeg[node, default: 0]
            let outDegree = outdeg[node, default: 0]
            if inDegree == 0 && outDegree > 1 {
                if cNode == -1 || node < cNode {
                    cNode = node
                }
            }
        }
        return cNode
    }
    let cNode = centerNode()
    if cNode == -1 {
        return []
    }
    var g1 = 0  // 도넛
    var g2 = 0  // 막대
    var g3 = 0  // 8자
    
    func dfs(_ node: Int) -> Int {
        vis.insert(node)
        let deg = adj[node]?.count ?? 0
        if deg == 0 { return -1 } 
        var maxDeg = deg
        for nxt in adj[node] ?? [] {
            if !vis.contains(nxt) {
                let childDeg = dfs(nxt)
                if childDeg == -1 {
                    maxDeg = -1
                } else {
                    maxDeg = max(maxDeg, childDeg)
                }
            }
        }
        return maxDeg
    }
    for nxt in adj[cNode] ?? [] {
        if !vis.contains(nxt) {
            let val = dfs(nxt)
            if val == 1 {
                g1 += 1 
            } else if val == -1 {
                g2 += 1  
            } else {
                g3 += 1 
            }
        }
    }
    return [cNode, g1, g2, g3]
}