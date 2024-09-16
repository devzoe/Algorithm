import Foundation

func readInput() -> (Int, Int, [Int], [Int]) {
    let N_MAX = 1000
    var n = 0, m = 0
    var names = [Int](repeating: 0, count: N_MAX)
    var dp = [Int](repeating: Int.max, count: N_MAX)
    
    if let firstLine = readLine() {
        let nm = firstLine.split(separator: " ").compactMap { Int($0) }
        if nm.count == 2 {
            n = nm[0]
            m = nm[1]
        }
    }
    
    for i in 0..<n {
        if let line = readLine(), let value = Int(line.trimmingCharacters(in: .whitespacesAndNewlines)) {
            names[i] = value
        }
    }
    dp[n - 1] = 0
    return (n, m, names, dp)
}

func DP(_ idx: Int, _ n: Int, _ m: Int, _ names: [Int], _ dp: inout [Int]) -> Int {
    if dp[idx] < Int.max {
        return dp[idx]
    }
    var remain = m - names[idx]
    var i = idx + 1
    while i <= n && remain >= 0 {
        if i == n {
            dp[idx] = 0
            break
        }
        dp[idx] = min(dp[idx], remain * remain + DP(i, n, m, names, &dp))
        remain -= names[i] + 1
        i += 1
    }
    return dp[idx]
}

func main() {
    var (n, m, names, dp) = readInput()
    print(DP(0, n, m, names, &dp))
}
main()
