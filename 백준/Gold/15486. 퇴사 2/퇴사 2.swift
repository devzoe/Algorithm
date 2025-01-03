import Foundation

func main() {
    let n = Int(readLine()!)!
    var arr = [[Int]]()
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)!}
        arr.append(line)
    }
    var dp = [Int](repeating: 0, count: n+1)
    for (i,a) in arr.enumerated() {
        let (t, p) = (a[0], a[1])
        if i > 0 && dp[i] < dp[i-1]{ dp[i] = dp[i-1] }
        if i+t <= n {
            dp[i+t] = max(dp[i] + p, dp[i+t])
        }
    }
    print(dp.max()!)
    
}
main()