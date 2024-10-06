import Foundation

func solution(_ s: String) -> Int {
    if s.count == 1 { return 1 }
    let maxCut = s.count / 2
    var minLength = s.count
    for x in 1...maxCut {
        var prev = ""
        var cnt = 1
        var length = 0

        for j in stride(from: 0, through: s.count, by: x) {
            let startIdx = s.index(s.startIndex, offsetBy: j)
            let endIdx = s.index(startIdx, offsetBy: x, limitedBy: s.endIndex) ?? s.endIndex
            let curr = String(s[startIdx..<endIdx])

            if prev == curr {
                cnt += 1
                continue
            }

            if cnt > 1 {
                length += String(cnt).count
                cnt = 1
            }
            length += curr.count
            prev = curr
        }

        minLength = min(length, minLength)
    }

    return minLength
}
