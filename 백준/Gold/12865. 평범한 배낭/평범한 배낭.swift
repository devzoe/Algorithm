import Foundation

func readInput() -> (Int, Int, [(Int, Int)]) {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let N = firstLine[0]
    let K = firstLine[1]
    
    var items = [(Int, Int)]()
    for _ in 0..<N {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let weight = line[0]
        let value = line[1]
        items.append((weight, value))
    }
    
    return (N, K, items)
}

func knapsack(N: Int, K: Int, items: [(Int, Int)]) -> Int {
    var dp = Array(repeating: 0, count: K + 1)
    
    for (weight, value) in items {
        if weight <= K {
            for j in stride(from: K, through: weight, by: -1) {
                dp[j] = max(dp[j], dp[j - weight] + value)
            }
        }
    }
    
    return dp[K]
}

let (N, K, items) = readInput()
let result = knapsack(N: N, K: K, items: items)
print(result)
