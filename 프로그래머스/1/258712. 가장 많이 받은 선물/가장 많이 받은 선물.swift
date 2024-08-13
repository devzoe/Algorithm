import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var d: [String: Int] = [:]
    var i = 0
    for f in friends {
        d[f] = i
        i += 1
    }
    
    var arr: [[Int]] = [[Int]](repeating:[Int](repeating:0, count: friends.count), count: friends.count)
    var giftCnt = Array(repeating: 0, count: friends.count)
    for g in gifts {
        let s = g.split(separator: " ")
        let giver = String(s[0])
        let taker = String(s[1])
        arr[d[giver]!][d[taker]!] += 1
        giftCnt[d[giver]!] += 1
        giftCnt[d[taker]!] -= 1
    }
    
    var nextMonth = Array(repeating: 0, count: friends.count)
    for i in 0..<friends.count {
        for j in (i+1)..<friends.count {
            if arr[i][j] > arr[j][i] {
                nextMonth[i] += 1
            } else if arr[i][j] < arr[j][i] {
                nextMonth[j] += 1
            } else {
                if giftCnt[i] > giftCnt[j] {
                    nextMonth[i] += 1
                } else if giftCnt[i] < giftCnt[j] {
                    nextMonth[j] += 1
                } else {
                    continue
                }
            }
        }
    }
    return nextMonth.max()!
}