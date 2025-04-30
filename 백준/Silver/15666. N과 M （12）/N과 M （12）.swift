import Foundation

var n = 0, m = 0
var arr = [Int](repeating: 0, count: 10)
var num = [Int]()

func seq(_ x: Int, _ len: Int) {
    if len == m {
        print(arr[0..<m].map { String($0) }.joined(separator: " "))
        return
    }

    var last = 0
    for i in x..<n {
        if num[i] != last {
            arr[len] = num[i]
            last = num[i]
            seq(i, len + 1)
        }
    }
}

if let firstLine = readLine(), let secondLine = readLine() {
    let parts = firstLine.split(separator: " ").map { Int($0)! }
    n = parts[0]
    m = parts[1]

    num = secondLine.split(separator: " ").map { Int($0)! }
    num.sort()

    seq(0, 0)
}
