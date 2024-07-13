import Foundation

func readInput() -> (Int, Int, [Int]) {
    let N = Int(readLine()!)!
    let request = readLine()!.split(separator: " ").map { Int($0)! }
    let maxBudget = Int(readLine()!)!
    
    return (N, maxBudget, request)
}

func allocateBudget(N: Int, maxBudget: Int, request: [Int]) -> Int {
    var max = request.max()!
    var result = 0
    for _ in stride(from: request.max()!, through: -1, by: -1) {
        var sum = 0
        for budget in request {
            if budget < max {
                sum += budget
            } else {
                sum += max
            }
        }
        if sum <= maxBudget {
            result = max
            break
        }
        max -= 1
    }
    return result
}

let (N, maxBudget, request) = readInput()
let result = allocateBudget(N: N, maxBudget: maxBudget, request: request)
print(result)