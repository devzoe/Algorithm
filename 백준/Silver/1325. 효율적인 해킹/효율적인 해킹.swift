import Foundation

func readInput() -> (Int, [[Int]]) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let N = line[0]
    let M = line[1]
    
    var link = [[Int]](repeating: [], count: N + 1)
    for _ in 0..<M {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        link[line[1]].append(line[0])
    }
    return (N, link)
}
func dfs(_ current: Int, _ visited: inout [Bool], _ link: [[Int]]) {
    visited[current] = true
    for next in link[current] {
        if !visited[next] {
            dfs(next, &visited, link)
        }
    }
}

let (N, link) = readInput()
var result = [Int]()
var max = -1
for i in 1...N {
    var visited = [Bool](repeating: false, count: N + 1)
    dfs(i, &visited, link)
    let count = visited.filter{$0}.count
    if count > max {
        max = count
        result = [i]
    } else if count == max {
        result.append(i)
    }
}
result.sort()
print(result.map { String($0) }.joined(separator: " "))