import Foundation

func sumSquares(n: Int) -> Int {
    var dp = [Int](repeating: Int.max, count: n + 1)
    dp[0] = 0
    
    for i in 1...n {
        var j = 1
        while j * j <= i {
            dp[i] = min(dp[i], dp[i - j * j] + 1)
            j += 1
        }
    }
    
    return dp[n]
}

if let input = readLine(), let n = Int(input) {
    let result = sumSquares(n: n)
    print(result)
}