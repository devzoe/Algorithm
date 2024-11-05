import Foundation

func main() {
    let n = Int(readLine()!)!
    var map: [[Int]] = []
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        map.append(line)
    }
    var costs = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    costs[0][0] = 1
    let direction = [(0,1),(1,0)]
    for i in 0..<n {
        for j in 0..<n {
            if i == n-1 && j == n-1 { break }
            for d in direction {
                let x = i + map[i][j]*d.0
                let y = j + map[i][j]*d.1
                if x < n && y < n {
                    costs[x][y] += costs[i][j]
                }
            }
        }
    }
    print(costs[n-1][n-1])
}
main()