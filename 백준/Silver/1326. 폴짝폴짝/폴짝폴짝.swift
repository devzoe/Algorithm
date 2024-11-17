func main() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (line[0] - 1, line[1] - 1)

    var costs: [Int] = [Int](repeating: Int.max, count: n)
    var visited: [Bool] = [Bool](repeating: false, count: n)
    var queue: [(Int, Int)] = [(a, 0)]
    
    costs[a] = 0
    visited[a] = true

    while !queue.isEmpty {
        let (node, cost) = queue.removeFirst()
        
        if node == b {
            print(cost)
            return
        }

        let dist = arr[node]
        
        for i in stride(from: node + dist, to: n, by: dist) {
            if !visited[i] {
                visited[i] = true
                queue.append((i, cost + 1))
            }
        }

        for i in stride(from: node - dist, through: 0, by: -dist) {
            if !visited[i] {
                visited[i] = true
                queue.append((i, cost + 1))
            }
        }
    }

    print(-1)
}
main()
