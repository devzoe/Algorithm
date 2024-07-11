import Foundation

func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
    var visited = [Bool](repeating: false, count: info.count)
    var answer = [Int]()
    
    func dfs(sheep: Int, wolf: Int) {
        if sheep > wolf {
            answer.append(sheep)
        } else {
            return
        }
        for edge in edges {
            let parent = edge[0]
            let child = edge[1]
            if visited[parent] && !visited[child] {
                visited[child] = true
                if info[child] == 0 {
                    dfs(sheep: sheep + 1, wolf: wolf)
                } else {
                    dfs(sheep: sheep, wolf: wolf + 1)
                }
                visited[child] = false
            }
        }
    }
    
    visited[0] = true
    dfs(sheep: 1, wolf: 0)
    return answer.max() ?? 0
}