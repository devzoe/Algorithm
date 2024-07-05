import Foundation

func readInput() -> (Int, Int, [Int], [[Int]]) {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let n = firstLine[0]
    let m = firstLine[1]
    
    let plan = readLine()!.split(separator: " ").map { Int($0)! }
    
    var cost = [[Int]]()
    for _ in 0..<n - 1 {
        let costLine = readLine()!.split(separator: " ").map { Int($0)! }
        cost.append(costLine)
    } 
    return (n, m, plan, cost)
}

func calculateCost(n: Int, m: Int, plan: [Int], cost: [[Int]]) -> Int {
    var count = [Int](repeating: 0, count: n + 1)
    for i in 0..<m - 1 {
        if plan[i] < plan[i + 1] {
            count[plan[i]] += 1
            count[plan[i + 1]] -= 1
        } else {
            count[plan[i + 1]] += 1
            count[plan[i]] -= 1
        }
    }

    var sum = 0
    var answer = 0
    for i in 0..<n - 1 {
        sum += count[i + 1]
        answer += min(cost[i][0] * sum, cost[i][1] * sum + cost[i][2])
    }
    return answer
}

let (n, m, plan, cost) = readInput()
let result = calculateCost(n: n, m: m, plan: plan, cost: cost)
print(result)
