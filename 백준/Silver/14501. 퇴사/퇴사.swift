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
    for i in 0..<N {
        if cost[i][0] + i > N { continue } //이 날 상담해도 되는지 체크
        memoCost[i] = cost[i][1] //얻는 금액
        for j in 0..<i {
            if cost[j][0] + j <= i { //상담하면 i일에 상담할 수 있는지 체크
                memoCost[i] = max(memoCost[i], cost[i][1] + memoCost[j]) //최대 이익에 더하기
            }
        }
    }
    return memoCost.max()!
}

let (N, cost) = readInput()
let result = calculateCost(N: N, cost: cost)
print(result)