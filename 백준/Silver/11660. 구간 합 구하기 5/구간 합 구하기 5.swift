import Foundation

func readInput() -> (Int, Int, [[(Int, Int)]], [[Int]]) {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let N = firstLine[0]
    let M = firstLine[1]
    var map = [[Int]]()
    for _ in 0..<N {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        map.append(line)
    }
    var range = [[(Int, Int)]]()
    for _ in 0..<M {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        range.append([(line[0], line[1]), (line[2], line[3])])
    }
    return (N, M, range, map)
}

func createDP(N: Int, map: [[Int]]) -> [[Int]] {
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
    for i in 1...N {
        for j in 1...N {
            dp[i][j] = map[i - 1][j - 1] + dp[i - 1][j] + dp[i][j - 1] - dp[i - 1][j - 1]
        }
    }
    return dp
}

func calculateCost(N: Int, M: Int, range: [[(Int, Int)]], map: [[Int]]) -> [Int] {
    var result = [Int]()
    let dp = createDP(N: N, map: map)
    
    for rangeItem in range {
        let x1 = rangeItem[0].0
        let y1 = rangeItem[0].1
        let x2 = rangeItem[1].0
        let y2 = rangeItem[1].1
        
        let sum = dp[x2][y2] - dp[x1 - 1][y2] - dp[x2][y1 - 1] + dp[x1 - 1][y1 - 1]
        result.append(sum)
    }
    
    return result
}

let (N, M, range, map) = readInput()
let result = calculateCost(N: N, M: M, range: range, map: map)
result.forEach { print($0) }