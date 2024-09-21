import Foundation

func solution(_ n: Int, _ start: Int, _ target: Int, _ graph: [[Int]]) -> Int {
    var queue: [(Int,Int)] = [(start, 0)]
    var visited: [Bool] = [Bool](repeating: false, count: n+1)
    visited[start] = true
    while !queue.isEmpty {
        let (curr, cnt) = queue.removeFirst()
        if curr == target { return cnt }
        for next in graph[curr] {
            if !visited[next] {
                visited[next] = true
                queue.append((next, cnt+1))
            }
        }
    }
    return -1
}

func main() {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0], b = ab[1]
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var graph: [[Int]] = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        graph[line[0]].append(line[1])
        graph[line[1]].append(line[0])
    }
    let result = solution(n,a,b,graph)
    print(result)
    
}
main()
