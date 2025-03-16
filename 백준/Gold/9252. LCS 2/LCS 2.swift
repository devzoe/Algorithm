import Foundation

let s1 = Array(readLine()!)
let s2 = Array(readLine()!)
var lcs: [[Int]] = [[Int]](repeating:[Int](repeating: 0, count: s2.count+1),count: s1.count+1)

for i in 1...s1.count {
    for j in 1...s2.count {
        if s1[i-1] == s2[j-1] {
            lcs[i][j] = lcs[i - 1][j - 1] + 1
        }
        else {
            lcs[i][j] = max(lcs[i - 1][j], lcs[i][j - 1])
        }
    }
}
var result: [Character] = []
var curr = lcs[s1.count].max()!
print(curr)
if curr > 0 {
    var i = s1.count
    var j = s2.count
    while curr != 0 {
        if lcs[i-1][j] == curr {
            i -= 1
        } else if lcs[i][j-1] == curr {
            j -= 1
        } else {
            result.append(s1[i-1])
            i -= 1
            j -= 1
            curr -= 1
        }
    }
    result.reverse()
    print(result.map{String($0)}.joined())
}