import Foundation

func solution(_ s:String) -> [Int] {
    let str = s.replacingOccurrences(of: "{",with: "")
    let t = str.split(separator: "}").map { String($0) }
    var arr: [[Int]] = []
    t.forEach {
        arr.append($0.split(separator: ",").map { Int($0)! })
    }
    arr.sort(by: {$0.count < $1.count})
    var result: [Int] = []
    for a in arr {
        let b = a.filter { !result.contains($0) }
        result.append(b[0])
    }
    return result
}