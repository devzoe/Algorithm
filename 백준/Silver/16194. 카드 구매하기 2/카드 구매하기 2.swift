import Foundation

func readInput() -> (Int, [Int]) {
    let N = Int(readLine()!)!
    let cost = readLine()!.split(separator: " ").map { Int($0)! }
    return (N, cost)
}

func calculateCost(N: Int, cost: [Int]) -> Int {
    var card = [Int](repeating: Int.max, count: N+1)
    card[0] = 0
    for i in 1...N {
        for j in 1...i {
            card[i] = min(card[i], card[i-j]+cost[j-1])
        }
    }
    
    return card[N]
}

let (N, cost) = readInput()
let result = calculateCost(N: N, cost: cost)
print(result)