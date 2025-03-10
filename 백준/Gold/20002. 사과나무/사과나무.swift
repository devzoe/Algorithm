import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []
var maxV = Int.min
for _ in 0..<n {
    let m = readLine()!.split(separator: " ").map { Int($0)! }
    maxV = max(maxV,m.max()!)
    arr.append(m)
}
var sum = arr
for i in 1..<n {
    sum[i][0] = sum[i-1][0] + arr[i][0]
    sum[0][i] = sum[0][i-1] + arr[0][i]
}
for i in 1..<n {
    for j in 1..<n {
        sum[i][j] = arr[i][j] + sum[i-1][j] + sum[i][j-1] - sum[i-1][j-1]
    }
}
for k in 1..<n {
    for i in 0..<n-k {
        for j in 0..<n-k {
            let x = i+k
            let y = j+k
            var a = 0
            var b = 0
            var c = 0
            if j != 0 && i != 0 { c = sum[i-1][j-1] }
            if j != 0 { a = sum[x][j-1] }
            if i != 0 { b = sum[i-1][y] }
            let s = sum[x][y] - a - b + c
            maxV = max(maxV,s)
        }
    }
}
print(maxV)