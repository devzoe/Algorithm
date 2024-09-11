func readInput() -> (Int, [Int]) {
    let N = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }

    return (N, arr)
}
func DP(_ N: Int, _ arr: [Int], _ target: Int) -> Int {
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 21), count: N)
    dp[0][arr[0]] = 1
    for i in 0..<N-1 {
        for j in 0...20 {
            if dp[i][j] > 0 {
                if (0...20) ~= j+arr[i+1] {
                    dp[i+1][j+arr[i+1]] += dp[i][j]
                }
                if (0...20) ~= j-arr[i+1] {
                    dp[i+1][j-arr[i+1]] += dp[i][j]
                }
            }
        }
    }

    return dp[N-1][target]
}
func main() {
    let (N, arr) = readInput()
    let result = DP(N-1, arr, arr[N-1])
    print(result)
}

main()