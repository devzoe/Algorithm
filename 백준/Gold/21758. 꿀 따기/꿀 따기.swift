import Foundation

let n = Int(readLine()!)!
let honey = readLine()!.split(separator: " ").map { Int($0)! }
var p_sum = [Int](repeating: 0, count: n)
p_sum[0] = honey[0]

for i in 1..<n {
    p_sum[i] = p_sum[i - 1] + honey[i]
}

var ans = 0
for i in 1..<(n - 1) {
    let right = 2 * p_sum[n - 1] - honey[0] - honey[i] - p_sum[i]
    let left = p_sum[n - 1] - honey[n - 1] - honey[i] + p_sum[i - 1]
    let mid = p_sum[i] - honey[0] + p_sum[n - 1] - p_sum[i - 1] - honey[n - 1]
    
    ans = max(ans, right, left, mid)
}

print(ans)