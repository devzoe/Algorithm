import Foundation

func bfs(_ n: Int, _ arr: [[Int]], _ i: Int, _ j: Int, _ visited: inout [[Bool]]) -> Int {
    var cnt = 0
    var queue: [(Int,Int)] = [(i,j)]
    let direction = [(0,1),(0,-1),(1,0),(-1,0)]
    visited[i][j] = true
    cnt += 1
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        for d in direction {
            let newX = x+d.0
            let newY = y+d.1
            if 0 <= newX && newX < n && 0 <= newY && newY < n && !visited[newX][newY] && arr[newX][newY] == 1 {
                queue.append((newX,newY))
                visited[newX][newY] = true
                cnt += 1
            }
        }
    }
    return cnt
}

func main() {
    let n = Int(readLine()!)!
    var arr = [[Int]]()
    for _ in 0..<n {
        let line = readLine()!.map { Int(String($0))! }
        arr.append(line)
    }
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var result: [Int] = []
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] && arr[i][j] == 1 {
                let cnt = bfs(n, arr, i, j, &visited)
                result.append(cnt)
            }
        }
    }
    print(result.count)
    result.sort()
    result.forEach { i in
        print(i)
    }
}
main()
