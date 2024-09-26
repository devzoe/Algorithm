import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var tree: [[Int]] = [[Int]](repeating: [], count:n+1)
    for w in wires {
        tree[w[0]].append(w[1])
        tree[w[1]].append(w[0])
    }
    func bfs(_ startNode: Int, _ except: Int, _ visited: inout [Bool], _ cnt: inout Int) {
        var queue = [startNode]
        visited[startNode] = true
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            cnt += 1
            for next in tree[curr] {
                if !visited[next] && next != except {
                    visited[next] = true
                    queue.append(next)
                }
            }
        }  
    } 
    var result: [Int] = []
    for w in wires {
        let start = w[0], except = w[1]
        var visited: [Bool] = [Bool](repeating: false, count: n+1)
        var cnt1 = 0
        bfs(start, except, &visited, &cnt1)
        var cnt2 = 0
        bfs(except, start, &visited, &cnt2)
        result.append(abs(cnt2-cnt1))
    }
    return result.min()!
}