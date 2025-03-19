import Foundation

func diff(_ exInt: Int, _ curInt: Int) -> Int {
    var ex = Double(exInt)
    var cur = Double(curInt)
    
    ex *= pow(2, 20)
    
    for n in -20..<0 {
        if ex <= cur {
            return n
        }
        ex /= 2
    }
    
    for n in 0..<20 {
        if ex <= cur {
            return n
        }
        cur *= 2
    }
    return 20
}

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }
var P = [Int](repeating: 0, count: N+1)
var ans = 0

for i in 1..<N {
    let d = diff(A[i-1], A[i]) + max(0, P[i-1])
    P[i] = d
    
    if d > 0 {
        ans += d
    }
}

print(ans)