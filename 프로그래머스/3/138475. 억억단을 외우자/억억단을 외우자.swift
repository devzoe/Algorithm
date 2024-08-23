import Foundation

func solution(_ e: Int, _ starts: [Int]) -> [Int] {
    var count = Array(repeating: 0, count: e + 1)
    
    for i in 1...e {
        var j = i
        while j <= e {
            count[j] += 1
            j += i
        }
    }
    
    var dp = Array(repeating: 0, count: e + 1)
    dp[e] = e
    var maxIndex = e

    for i in stride(from: e - 1, to: 0, by: -1) {
        if count[i] > count[maxIndex] || (count[i] == count[maxIndex] && i < maxIndex) {
            maxIndex = i
        }
        dp[i] = maxIndex
    }
    
    return starts.map { dp[$0] }
}
