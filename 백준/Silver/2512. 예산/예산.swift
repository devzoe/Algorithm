import Foundation

func readInput() -> (Int, Int, [Int]) {
    let N = Int(readLine()!)!
    let request = readLine()!.split(separator: " ").map { Int($0)! }
    let budget = Int(readLine()!)!
    
    return (N, budget, request)
}

func findMaxBudget(N: Int, budget: Int, request: [Int]) -> Int {
    var start = 0
    var end = request.max()!
    var result = 0
    while start <= end {
        var sum = 0
        let mid = (start + end) / 2
        for req in request {
            if req < mid {
                sum += req
            } else {
                sum += mid
            }
        }
        if sum <= budget {
            start = mid + 1
            result = mid
        } else {
            end = mid - 1
        }
    }
    return result
}

let (N, budget, request) = readInput()
let result = findMaxBudget(N: N, budget: budget, request: request)
print(result)