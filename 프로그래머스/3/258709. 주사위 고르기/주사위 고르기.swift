import Foundation

func combination(_ n: Int, _ k: Int) -> [[[Int]]] {
    var result: [[[Int]]] = []
    var arr: [Int] = []
    for i in 1...n { arr.append(i) }
    
    func backtrack(_ i: Int, _ ans: inout [Int]) {
        if ans.count == k {
            let opp = arr.filter { !ans.contains($0) }
            result.append([ans, opp])
            return
        }
        for next in i..<n+1 {
            ans.append(next)
            backtrack(next + 1, &ans)
            ans.removeLast()
        }
    }
    var ans: [Int] = []
    backtrack(1, &ans)
    return result
}

func getSum(_ diceIndices: [Int], _ dice: [[Int]]) -> [Int] {
    let count = diceIndices.count
    var sums: [Int] = []
    
    func calculateSum(_ idx: Int, _ currentSum: Int) {
        if idx == count {
            sums.append(currentSum)
            return
        }
        for face in 0..<6 {
            calculateSum(idx + 1, currentSum + dice[diceIndices[idx] - 1][face])
        }
    }
    
    calculateSum(0, 0)
    return sums
}

func binarySearch(_ array: [Int], _ target: Int, isUpperBound: Bool) -> Int {
    var low = 0
    var high = array.count
    
    while low < high {
        let mid = (low + high) / 2
        if isUpperBound {
            if array[mid] > target {
                high = mid
            } else {
                low = mid + 1
            }
        } else {
            if array[mid] >= target {
                high = mid
            } else {
                low = mid + 1
            }
        }
    }
    
    return low
}

func calculateOutcome(_ aDice: [Int], _ bDice: [Int], _ dice: [[Int]]) -> (win: Int, draw: Int, lose: Int) {
    let aSums = getSum(aDice, dice)
    let bSums = getSum(bDice, dice).sorted()
    
    var win = 0, draw = 0, lose = 0
    
    for aSum in aSums {
        let winCount = binarySearch(bSums, aSum, isUpperBound: false)
        let drawCount = binarySearch(bSums, aSum, isUpperBound: true) - winCount
        win += winCount
        draw += drawCount
        lose += bSums.count - (winCount + drawCount)
    }
    
    return (win, draw, lose)
}

func solution(_ dice: [[Int]]) -> [Int] {
    let n = dice.count
    let half = n / 2
    let combinations = combination(n, half)
    
    var best: [Int] = []
    var maxWin: Double = -1.0
    
    for combo in combinations {
        let aDice = combo[0]
        let bDice = combo[1]
        
        let outcome = calculateOutcome(aDice, bDice, dice)
        let totalMatches = outcome.win + outcome.draw + outcome.lose
        let win = Double(outcome.win) / Double(totalMatches)
        
        if win > maxWin {
            maxWin = win
            best = aDice
        }
    }
    
    return best.sorted()
}