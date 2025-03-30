import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0],nk[1])
let m = max(n,k)

var dp: [Int] = [Int](repeating: Int.max, count: m+2)
var queue: [(Int,Int)] = [(n,0)]
dp[n] = 0

while !queue.isEmpty {
    let (curr, cost) = queue.removeFirst()
    if curr == k {
        break
    }
    
    if curr-1 >= 0 && cost+1 < dp[curr-1] {
        dp[curr-1] = cost+1
        queue.append((curr-1,cost+1))
    }

    if curr+1 <= k && cost+1 < dp[curr+1] {
        dp[curr+1] = cost+1
        queue.append((curr+1,cost+1))
    }
    
    if curr*2 <= k+1 && cost < dp[curr*2] {
        dp[curr*2] = cost
        queue.append((curr*2,cost))
    }
    queue.sort{ $0.1 < $1.1 }
}
print(dp[k])