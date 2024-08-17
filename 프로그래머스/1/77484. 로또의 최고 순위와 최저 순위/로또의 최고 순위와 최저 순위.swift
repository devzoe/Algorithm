import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let rank = [6:1,5:2,4:3,3:4,2:5]
    let minSync = lottos.filter{ win_nums.contains($0)  }.count
    let zeroCnt = lottos.filter{$0 == 0}.count
    let maxSync = minSync + zeroCnt

    if let minRank = rank[minSync] {
        if let maxRank = rank[maxSync] {
            return [maxRank, minRank]
        }
        return [6,minRank]
    } else {
        if let maxRank = rank[maxSync] {
            return [maxRank, 6]
        }
    }
    return [6,6]
}