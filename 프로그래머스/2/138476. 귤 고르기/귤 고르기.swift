import Foundation

func solution(_ k: Int, _ tangerine: [Int]) -> Int {
    if tangerine.count == 1 { return 1 }
    var countDict: [Int: Int] = [:]
    var temp: [Int] = []
    var result = 0
    var answer = 0
    
    for tang in tangerine {
        countDict[tang, default: 0] += 1
    }
    
    temp = Array(countDict.values).sorted(by: >)
    
    for cnt in temp {
        result += cnt
        answer += 1
        if result >= k {
            return answer
        }
    }
    
    return answer
}