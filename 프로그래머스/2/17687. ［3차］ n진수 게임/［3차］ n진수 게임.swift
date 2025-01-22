func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var cnt = m * t
    var result = ""
    var s = ""
    for i in 0..<cnt {
        let r = String(i, radix:n)
        s += r
    }
    var cur = 0
    while result.count < t {
        if cur % m == p-1 {
            result += String(s[s.index(s.startIndex, offsetBy: cur)]).uppercased()
        }
        cur += 1
    }
    return result
}