import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    var arr = readLine()!.split(separator: " ").map { Int($0)! }
    let n = arr[0]+1
    arr = Array(arr[1..<n])
    arr.sort()
    if n == 1 { print(0) }
    var s: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    var sum: [Int] = [Int](repeating: 0, count: n)
    for i in 1..<n {
        sum[i] = sum[i-1]+arr[i-1]
    }
    for i in 2..<n {
        for j in i..<n {
            s[i][j] = i*arr[j-1] - (sum[j]-sum[j-i])
        }
    }
    var ans = 0
    for i in 2..<n {
        ans += s[i].min()!
    }
    print(ans)
}