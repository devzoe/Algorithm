import Foundation

func readInput() -> (Int, [Int]) {
    let N = Int(readLine()!)!
    let P = readLine()!.split(separator: " ").map { Int($0)! }
    return (N, P)
}

func calculateCost(N: Int, P: [Int]) -> Int {
    var card = [Int](repeating: 0, count: N+1)
    for i in 1...N {
        for j in 1...i {
            card[i] = max(card[i], card[i-j]+P[j-1])
        }
    }
    return card[N]
}

let (N, P) = readInput()
let result = calculateCost(N: N, P: P)
print(result)