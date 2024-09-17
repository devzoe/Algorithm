func readInput() -> (Int, Int, Int, [Int]) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let n = line[0], s = line[1], m = line[2]
    let v = readLine()!.split(separator: " ").map { Int($0)! }
    
    return (n, s, m, v)
}

func DP(_ n: Int, _ s: Int, _ m: Int, _ v: [Int]) -> Int {
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n)
    if (0...m) ~= s+v[0] {
        dp[0][s+v[0]] = 1
    }
    if (0...m) ~= s-v[0] {
        dp[0][s-v[0]] = 1
    }
    if dp[0].max()! == 0 { return -1 }
    for i in 1..<n {
        for j in 0...m {
            if dp[i-1][j] == 1 {
                if (0...m) ~= j + v[i] {
                    dp[i][j + v[i]] = 1
                }
                if (0...m) ~= j - v[i] {
                    dp[i][j - v[i]] = 1
                }
            }
        }
        if dp[i].max()! == 0 { return -1 }
    }
    return dp[n-1].lastIndex(of: 1)!
}

func main() {
    let (n, s, m, v) = readInput()
    let result = DP(n, s, m, v)
    print(result)
}
main()
