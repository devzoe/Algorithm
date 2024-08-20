import Foundation

func readInput() -> (Int, [Int], [Int]) {
    let N = Int(readLine()!)!
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    let b = readLine()!.split(separator: " ").map { Int($0)! }
    let L = [0] + a
    let J = [0] + b
    return (N, L, J)
}

func hello(_ N: Int, _ L: [Int], _ J: [Int]) {
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 101), count: N + 1)
    for i in 1..<N+1{
        for j in 1..<101 {
            if L[i] <= j {
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-L[i]] + J[i])
            }
            else {
                dp[i][j] = dp[i-1][j]
            }
        }
    }
    print(dp[N][99])
}

let (N, L, J) = readInput()
hello(N, L, J)