func DP(_ N: Int) {
    guard N % 2 == 0 else {
        print(0)
        return
    }
    var dp = [Int](repeating: 0, count: N+1)
    dp[0] = 1
    dp[1] = 0
    dp[2] = 3
    guard N > 2 else {
        print(dp[N])
        return
    }
    for i in stride(from: 4, through: N, by: 2) {
        dp[i] = dp[i-2] * dp[2]
        for j in stride(from: i-4, through: 0, by: -2){
            dp[i] = dp[i] + dp[j] * 2
        }
    }
    print(dp[N])
}

func main() {
    let N = Int(readLine()!)!
    DP(N)
}
main()