import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let s = String(n,radix: k)
    var check = ""
    var result = 0
    for ch in s {
        if ch == "0" {
            if !check.isEmpty {
                if checkPrime(Int(check)!){ result += 1}
            }
            check = ""
        } else {
            check += String(ch)
        }
    }
    if !check.isEmpty {
        if checkPrime(Int(check)!){ result += 1 }
    }
    return result
}

func checkPrime(_ n: Int) -> Bool {
    if n <= 1 { return false }
    if n == 2 { return true }
    if n % 2 == 0 { return false }
    if n <= 7 { return true }
    for i in stride(from: 3, through: sqrt(Double(n)), by: 2) {
        if n % Int(i) == 0 {
            return false
        }
    }
    return true
}