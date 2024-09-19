
import Foundation

func readInput() -> (Int, Int, [Int]) {
    let tw = readLine()!.split(separator: " ").map { Int($0)! }
    let t = tw[0], w = tw[1]
    var arr = [Int](repeating: 0, count: t + 1)
    for i in 1...t {
        arr[i] = Int(readLine()!)!
    }
    return (t, w, arr)
}

func DP(_ t: Int, _ w: Int, _ arr: [Int]) -> Int {
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: w+1), count: t+1)
    var result = 0

    for i in 1...t {
        for j in 0...min(i, w) {
            if j == 0 {
                if arr[i] == 1 {
                    dp[i][j] = dp[i - 1][j] + 1
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            } else {
                if arr[i] == 1 && j % 2 == 0 {
                    dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - 1]) + 1
                } else if arr[i] == 2 && j % 2 == 1 {
                    dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - 1]) + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - 1])
                }
            }
            result = max(result, dp[i][j])
        }
    }

    return result
}

func main() {
    let (t, w, arr) = readInput()
    let result = DP(t,w,arr)
    print(result)
}

main()