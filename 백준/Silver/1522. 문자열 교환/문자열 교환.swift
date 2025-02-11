import Foundation

var s = Array(readLine()!)
let a = s.filter { $0 == "a" }.count
    
if a <= 1 {
    print(0)
} else if a > 1 {
    s += s[0..<(a-1)]
    var minValue = Int.max
    for i in 0..<(s.count - (a - 1)) {
        let b = s[i..<(i + a)].filter { $0 == "b" }.count
        minValue = min(minValue, b)
    }
    print(minValue)
}

