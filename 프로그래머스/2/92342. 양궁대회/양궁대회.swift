import Foundation

func solution(_ n: Int, _ info: [Int]) -> [Int] {
    var maxDiff = 0
    var bestResult = [-1]
    var dfsStack = [(aScore: 0, lScore: 0, idx: 0, usedArrows: 0, lionShots: Array(repeating: 0, count: 11))]

    while !dfsStack.isEmpty {
        let current = dfsStack.removeLast()
        let (aScore, lScore, idx, usedArrows, lionShots) = current
        
        if usedArrows > n {
            continue
        }

        if idx == 11 {
            let scoreDiff = lScore - aScore
            if scoreDiff > maxDiff {
                maxDiff = scoreDiff
                bestResult = lionShots
                bestResult[10] += (n - usedArrows)
            }
            continue
        }

        dfsStack.append((aScore + (info[10 - idx] > 0 ? idx : 0), lScore, idx + 1, usedArrows, lionShots))

        if usedArrows + info[10 - idx] + 1 <= n {
            var newShots = lionShots
            newShots[10 - idx] = info[10 - idx] + 1
            dfsStack.append((aScore, lScore + idx, idx + 1, usedArrows + newShots[10 - idx], newShots))
        }
    }

    return bestResult
}