import Foundation

let T = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<T {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(line)
}

var a: [Int] = [0,500,300,300,200,200,200,50,50,50,50,30,30,30,30,30,10,10,10,10,10,10]
var b: [Int] = [0]
var p = 9.0
for i in 0..<5 {
    let cnt = Int(pow(2.0, Double(i)))
    b += [Int](repeating: Int(pow(2.0, p)), count: cnt)
    p -= 1
}

for p in arr {
    var r1 = 0
    var r2 = 0
    if p[0] < a.count {
        r1 = p[0]
    }
    if p[1] < b.count {
        r2 = p[1]
    }
    if p[0] < a.count && p[1] < b.count {
        r1 = p[0]
        r2 = p[1]
    }
    print((a[r1]+b[r2]) * 10000)
}
