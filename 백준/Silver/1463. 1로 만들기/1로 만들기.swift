import Foundation

func solution(n: Int, d: inout [Int]) -> Int {
    if n == 1 { return 0 }
    if d[n] > 0 { return d[n] }
    d[n] = solution(n: n-1, d: &d) + 1
    if n % 2 == 0 {
        let temp = solution(n: n/2, d: &d) + 1
        if temp < d[n] { d[n] = temp }
    }
    if n % 3 == 0 {
        let temp = solution(n: n/3, d: &d) + 1
        if temp < d[n] { d[n] = temp }
    }
    return d[n]
}

let N = Int(readLine()!)!
var d = [Int](repeating: 0, count: N+1)
solution(n: N, d: &d)
print(d[N])