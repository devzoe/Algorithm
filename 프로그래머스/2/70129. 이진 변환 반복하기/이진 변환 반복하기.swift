import Foundation

func solution(_ s:String) -> [Int] {
    var x = s
    var cnt = 0
    var zeroCnt = 0
    while x != "1" {
        print(x)
        zeroCnt += x.filter { $0 == "0" }.count
        x = x.replacingOccurrences(of: "0", with: "")
        x = String(x.count, radix:2)
        cnt += 1
    }
    return [cnt, zeroCnt]
}