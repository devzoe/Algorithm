import Foundation

func readInput() -> (Int, Int, [Int]) {
    let N = Int(readLine()!)!
    let request = readLine()!.split(separator: " ").map { Int($0)! }
    let budget = Int(readLine()!)!
    
    return (N, budget, request)
}

func findMaxBudget(N: Int, budget: Int, request: [Int]) -> Int {
    var maxBudget = request.max()!
    while maxBudget > 0 {
        var sum = 0
        for req in request {
            if req < maxBudget {
                sum += req
            } else {
                sum += maxBudget
            }
        }
        if sum <= budget {
            return maxBudget
        }
        maxBudget -= 1
    }
    return maxBudget
}

let (N, budget, request) = readInput()
let result = findMaxBudget(N: N, budget: budget, request: request)
print(result)