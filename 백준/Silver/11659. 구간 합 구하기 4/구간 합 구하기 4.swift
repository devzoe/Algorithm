import Foundation

func main() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    var target: [[Int]] = []
    for _ in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        target.append(line)
    }
    var dp: [Int] = [Int](repeating: 0, count: n+1)
    dp[0] = 0
    for i in 1...n {
        dp[i] = dp[i-1] + arr[i-1]
    }
    for i in 0..<m {
        let a = target[i][0]-1
        let b = target[i][1]
        print(dp[b]-dp[a])
    }
}

main()