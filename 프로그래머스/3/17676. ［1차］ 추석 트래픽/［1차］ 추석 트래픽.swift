import Foundation

func solution(_ lines:[String]) -> Int {
    if lines.count == 1 { return 1 }
    var arr: [[Int]] = []
    var ans = -1
    for l in lines {
        let s = l.split(separator:" ")
        let t = s[1].split(separator:":").map { Double(String($0))! }
        let time = t[0]*3600000 + t[1]*60000 + t[2]*1000
        let index = s[2].index(before: s[2].endIndex)
        let interval = Double(s[2][s[2].startIndex..<index])! * 1000.0 - 1
        let before = time - interval
        arr.append([Int(before),Int(time)]) 
    }
    for i in 0..<arr.count {
        var cnt = 1
        for j in i+1..<arr.count {
            if arr[i][1] + 999 >= arr[j][0] {
                cnt += 1
            }
        }
        ans = max(ans, cnt)
    }
    return ans
}