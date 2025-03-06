import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
for _ in 0..<m {
    let node = readLine()!.split(separator: " ").map { Int($0)! }
    arr[node[0]-1][node[1]-1] = true
}
for i in 0..<n {
    arr[i][i] = true
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            arr[i][j] = arr[i][j] || (arr[i][k] && arr[k][j])
        }
    }
}

for i in 0..<n {
    var cnt = 0
    for j in 0..<n {
        if !(arr[i][j]||arr[j][i]) { cnt += 1 }
    }
    print(cnt)
}