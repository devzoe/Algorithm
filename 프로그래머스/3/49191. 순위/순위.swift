import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var info = Array(repeating: [Int](), count: n+1)
    var winAndLoseInfo = [(Int, Int)](repeating: (0, 0), count: n+1)
    
    for i in 0..<results.count {
        let winNode = results[i][0]
        let loseNode = results[i][1]

        info[loseNode].append(winNode)
    }
    
    func dfs(start: Int) {
        var queue = [start]
        var visited = [Bool](repeating: false, count: n+1)
    
        while !queue.isEmpty {
            let node = queue.removeFirst()
            visited[node] = true

            for next in info[node] {
                if !visited[next] {
                    visited[next] = true
                
                    // 승, 패
                    winAndLoseInfo[next].0 += 1
                    winAndLoseInfo[start].1 += 1
                    
                    queue.append(next)
                }
            }
        }
    }
    
    for i in 1..<info.count {
        dfs(start: i)
    }

    return winAndLoseInfo.filter{ $0.0 + $0.1 == n - 1  }.count
}