import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
var dist: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
for _ in 0..<m {
    let node = readLine()!.split(separator: " ").map { Int($0)! }
    arr[node[0]-1][node[1]-1] = min(node[2], arr[node[0]-1][node[1]-1])
}
for i in 0..<n {
    for j in 0..<n {
        if i == j { dist[i][j] = 0 }
        else if arr[i][j] != Int.max { dist[i][j] = arr[i][j] }
    }
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if dist[i][k] == Int.max || dist[k][j] == Int.max { continue }
            dist[i][j] = min(dist[i][j], dist[i][k]+dist[k][j])
        }
    }
}
dist.forEach {
    print($0.map { $0 != Int.max ? String($0) : "0" }.joined(separator: " "))
}