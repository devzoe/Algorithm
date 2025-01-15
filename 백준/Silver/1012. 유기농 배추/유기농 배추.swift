let t = Int(readLine()!)!
for _ in 0..<t {
    let nmk = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,m,k) = (nmk[0],nmk[1],nmk[2])
    var arr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    for _ in 0..<k {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let (x,y) = (line[0],line[1])
        arr[x][y] = 1
    }
    let direction = [(0,1),(0,-1),(1,0),(-1,0)]
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var queue: [(Int,Int)] = []
    var  result = 0
    for i in 0..<n {
        for j in 0..<m {
            if arr[i][j] == 1 && !visited[i][j] {
                queue.append((i,j))
                result += 1
                while !queue.isEmpty {
                    let now = queue.removeFirst()
                    let (nx, ny) = (now.0, now.1)
                    for d in direction {
                        let x = nx + d.0
                        let y = ny + d.1
                        if 0 <= x && x < n && 0 <= y && y < m && !visited[x][y] && arr[x][y] == 1 {
                            visited[x][y] = true
                            queue.append((x,y))
                        }
                    }
                }
            }
        }
    }
    print(result)
}