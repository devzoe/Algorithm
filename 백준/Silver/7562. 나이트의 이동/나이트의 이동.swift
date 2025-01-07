import Foundation

func bfs(_ n: Int, _ start: [Int], _ end: [Int]) {
    var result = Int.max
    let direction = [(1,-2),(2,-1),(2,1),(1,2),(-1,2),(-2,1),(-2,-1),(-1,-2)]
    var queue: [(Int,Int,Int)] = [(start[0],start[1],0)]
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    while !queue.isEmpty {
        let (x, y, cost) = queue.removeFirst()
        if x == end[0] && y == end[1] {
            result = min(result, cost)
            continue
        }
        visited[x][y] = true
        for d in direction {
            let i = x + d.0
            let j = y + d.1
            if 0 <= i && i < n && 0 <= j && j < n && !visited[i][j] {
                visited[i][j] = true
                queue.append((i,j,cost+1))
            }
        }
    }
    print(result)
}

func main() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        let start = readLine()!.split(separator: " ").map { Int($0)! }
        let end = readLine()!.split(separator: " ").map { Int($0)! }
        bfs(n, start, end)
    }
}
main()