import Foundation

func solution(_ k: Int, _ d: Int) -> Int {
    var result = 0
    var i = 0
    while i <= d {
        let maxNum = Int(sqrt(Double(d*d - i*i)))
        let r = maxNum % k
        result += (maxNum - r) / k + 1
        i += k
    }
    return result
}