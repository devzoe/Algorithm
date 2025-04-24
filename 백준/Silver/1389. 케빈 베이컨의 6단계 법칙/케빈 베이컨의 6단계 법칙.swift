import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

var graph = [[Int]](repeating: [], count: n + 1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

func bfs(start: Int) -> Int {
    var num = [Int](repeating: 0, count: n + 1)
    var visited = [Bool](repeating: false, count: n + 1)
    var queue = [Int]()
    
    visited[start] = true
    queue.append(start)
    var index = 0

    while index < queue.count {
        let current = queue[index]
        index += 1
        for neighbor in graph[current] {
            if !visited[neighbor] {
                visited[neighbor] = true
                num[neighbor] = num[current] + 1
                queue.append(neighbor)
            }
        }
    }

    return num.reduce(0, +)
}

var result = [Int]()
for i in 1...n {
    result.append(bfs(start: i))
}

if let minIndex = result.firstIndex(of: result.min()!) {
    print(minIndex + 1)
}