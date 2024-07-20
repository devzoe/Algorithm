import Foundation

func readInput() -> (Int, [[Int]]) {
    let N = Int(readLine()!)!
    var cost = [[Int]]()
    for _ in 0..<N {
        let costLine = readLine()!.split(separator: " ").map { Int($0)! }
        cost.append(costLine)
    }
    return (N, cost)
}

func calculateCost(N: Int, cost: [[Int]]) -> Int {
    var memoCost: [Int] = Array(repeating: 0, count: N + 1)
    var maxProfit = 0

    for i in 0..<N {
        maxProfit = max(maxProfit, memoCost[i])
        let endDay = i + cost[i][0]
        if endDay <= N {
            memoCost[endDay] = max(memoCost[endDay], maxProfit + cost[i][1])
        }
    }
    
    return memoCost.max()!
}

let (N, cost) = readInput()
let result = calculateCost(N: N, cost: cost)
print(result)
