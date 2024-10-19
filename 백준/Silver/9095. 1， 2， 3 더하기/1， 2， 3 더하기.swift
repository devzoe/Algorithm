import Foundation

func main() {
    let t = Int(readLine()!)!
    var nums: [Int] = []
    for _ in 0..<t {
        nums.append(Int(readLine()!)!)
    }
    let maxN = nums.max()!
    var dp: [Int] = [Int](repeating: 0, count: maxN+1)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    for i in 4...maxN {
        dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
    }
    for n in nums {
        print(dp[n])
    }
}
main()