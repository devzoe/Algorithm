func readInput() -> (Int, Int) {
    let line = readLine()!.split(separator: " ").map{ Int($0)! }
    let n = line[0], m = line[1]
    
    return (n,m)
}

func DP(_ n: Int, _ m: Int) {
    var dp:[[Int]] = [[Int]](repeating: [Int](repeating: 1, count: m+1), count: n+1)
    guard n > 1 && m > 1 else { print(1); return }
    for i in 2...n {
        for j in 2...m {
            dp[i][j] = (dp[i-1][j] + dp[i][j-1] + dp[i-1][j-1]) % 1000000007
        }
    }
    print(dp[n][m])
}

func main() {
    let (n,m) = readInput()
    DP(n,m)
}
main()