import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append([line[0], line[1]])
}

arr.sort {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    }
    return $0[1] < $1[1]
}

var end = 0
var ans = 0

for num in arr {
    let s = num[0]
    let e = num[1]
    if end <= s {
        ans += 1
        end = e
    }
}
print(ans)