func DP(_ coin: [Int], _  k: Int) -> Int {
    var dp: [Int] = [Int](repeating: 10001, count: k+1)
    dp[0] = 0
    for i in coin {
        for j in 1...k {
            if j-i < 0 { continue }
            dp[j] = min(dp[j], dp[j-i]+1)
        }
    }
    return dp[k] != 10001 ? dp[k] : -1
}

func main() {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let n = line[0], k = line[1]
    var coin: [Int] = []
    for _ in 0..<n {
        let line = Int(readLine()!)!
        if coin.contains(line) || line > 10000 { continue }
        coin.append(line)
    }
    let result = DP(coin, k)
    print(result)
}

main()
