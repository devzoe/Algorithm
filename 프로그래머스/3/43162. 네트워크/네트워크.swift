import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var com: [[Int]] = [[Int]](repeating: [], count: n)
    for (i,c) in computers.enumerated() {
        for j in 0..<n {
            if i != j && c[j] == 1 {
                com[i].append(j)
            }
        }
    }
    func dfs(_ root: Int, _ curr: Int, _ visited: inout [Int]) {
        visited[curr] = root
        for next in com[curr] {
            if visited[next] == -1 {
                dfs(root,next,&visited)
            }
        }
    }
    var visited:[Int] = [Int](repeating:-1,count:n)
    for i in 0..<n {
        if visited[i] == -1 {
            dfs(i,i,&visited)
        }
    }
    var d: [Int:Int] = [:]
    visited.forEach {
        d[$0, default:0] += 1
    }
    return d.keys.count
}