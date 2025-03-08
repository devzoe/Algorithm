import Foundation

let n = Int(readLine()!)!
var v: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)

for i in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    v[i][0] = line[0]
    v[i][1] = line[1]
}
var young: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
var old: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
var maxHappy = Int.min
var minHappy = Int.max
var maxTired = Int.min
var minTired = Int.max

for i in 0..<n {
    if minHappy > v[i][0] && v[i][0] != 0 { minHappy = v[i][0] }
    if maxTired < v[i][1] && v[i][1] != 0 { maxTired = v[i][1] }
    young[i][0] = minHappy
    young[i][1] = maxTired
}

for i in stride(from: n-1, through: 0, by: -1) {
    if maxHappy < v[i][0] && v[i][0] != 0 { maxHappy = v[i][0] }
    if minTired > v[i][1] && v[i][1] != 0 { minTired = v[i][1] }
    old[i][0] = maxHappy
    old[i][1] = minTired
}

var ans = 0
for i in 0..<n-1 {
    if young[i][0] > old[i+1][0] && young[i][1] < old[i+1][1] {
        ans = i+1
    }
}
if ans == 0 { ans = -1 }
print(ans)