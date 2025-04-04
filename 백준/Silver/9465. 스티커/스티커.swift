let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var stickers: [[Int]] = []
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)
    var maxCost = 0
    for _ in 0..<2 {
        let sticker = readLine()!.split(separator: " ").map { Int($0)! }
        stickers.append(sticker)
    }
    for i in 0...1 {
        dp[i][0] = stickers[i][0]
    }
    
    for col in 0..<n {
        if col+1 < n {
            dp[1][col+1] = max(dp[1][col+1],dp[0][col] + stickers[1][col+1])
            dp[0][col+1] = max(dp[0][col+1],dp[1][col] + stickers[0][col+1])
        }
        if col+2 < n {
            dp[0][col+2] = max(dp[0][col+2], dp[0][col]+stickers[1][col+1]+stickers[0][col+2])
            dp[1][col+2] = max(dp[1][col+2], dp[0][col]+stickers[1][col+2])
            dp[0][col+2] = max(dp[0][col+2], dp[1][col]+stickers[0][col+2])
            dp[1][col+2] = max(dp[1][col+2], dp[1][col]+stickers[0][col+1]+stickers[1][col+2])
        }
    }
    dp.forEach {
        maxCost = max(maxCost, $0.max()!)
    }
    print(maxCost)
}