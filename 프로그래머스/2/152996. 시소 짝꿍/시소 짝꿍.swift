import Foundation

func solution(_ weights:[Int]) -> Int64 {
    let nums: [[Int]] = [[2,3],[3,4],[1,2]]
    var d: [Int:Int] = [:]
    var result = 0
    for w in weights {
        d[w, default:0] += 1
    }
    let key = d.keys.sorted()
    for k in key {
        var dp: [Int] = [Int](repeating:0,count:d[k]!+1)
        dp[0] = 0
        dp[1] = 0
        if d[k]! >= 2 {
            for i in 2...d[k]! {
                dp[i] = dp[i-1]+i-1
            }
        }
        result += dp[d[k]!]
        for num in nums {
            if k % num[0] == 0 {
                let n = k/num[0]*num[1]
                if key.contains(n) {
                    result += d[k]! * d[n]!
                }
            }
        }
    }
    return Int64(result)
}