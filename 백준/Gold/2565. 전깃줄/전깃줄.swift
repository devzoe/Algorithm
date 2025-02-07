import Foundation

let n = Int(readLine()!)!
var pairs = [(Int, Int)]()   

for _ in 0..<n {
    let line = readLine()!.split(separator:" ").map { Int($0)! }
    pairs.append((line[0], line[1]))
}
    
pairs.sort { $0.0 < $1.0 }
    
var dp = [Int](repeating: 0, count: n)
var answer = 0
    
for i in 0..<n {
    dp[i] = 1
    for j in 0..<i {
        if pairs[j].1 < pairs[i].1, dp[j] + 1 > dp[i] {
            dp[i] = dp[j] + 1
        }
    }
    answer = max(answer, dp[i])
}

print(n - answer)