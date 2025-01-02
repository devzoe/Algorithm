import Foundation

func main() {
    let n = Int(readLine()!)!
    var arr = [[Int]]()
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        arr.append(line)
    }
    var dp:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    dp[0][0] = 1
    for i in 0..<n {
        for j in 0..<n {
            if arr[i][j] == 0 { break }
            if dp[i][j] > 0 {
                let m = arr[i][j]
                if i+m < n {
                    dp[i+m][j] += dp[i][j]
                }
                if j+m < n {
                    dp[i][j+m] += dp[i][j]
                }
            }
        }
    }
    print(dp[n-1][n-1])
}
main()