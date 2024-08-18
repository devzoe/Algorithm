import Foundation

func readInput() -> (Int, Int, [Int]) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let N = line[0]
    let K = line[1]
    
    var coin = [Int]()
    for _ in 0..<N {
        coin.append(Int(readLine()!)!)
    }
    return (N, K, coin)
}
func solution(_ N: Int, _ K: Int, _ coin: [Int]) {
    var target = K
    var index = N - 1
    var result = 0
    while target != 0 {
        if target - coin[index] >= 0 {
            target -= coin[index]
            result += 1
        } else {
            index -= 1
        }
    }
    print(result)
}
let (N, K, coin) = readInput()
solution(N, K, coin)