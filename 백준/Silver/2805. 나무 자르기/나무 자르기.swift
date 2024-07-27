import Foundation

func readInput() -> (Int, Int, [Int]) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let N = line[0]
    let M = line[1]
    
    var tree = readLine()!.split(separator: " ").map { Int($0)! }
    tree.sort()
    return (N, M, tree)
}

func solution(N: Int, M: Int, tree: [Int]) -> Int {
    var result = 0
    var start = 0
    var end = tree.max()!
    
    while start <= end {
        let mid = (start + end) / 2
        var totalCut = 0
        for t in tree {
            if t <= mid { continue }
            let cut = t - mid
            totalCut += cut
        }
        if totalCut >= M {
            if result < mid {
                result = mid
            }
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return result
}

let (N, M, tree) = readInput()
let result = solution(N: N, M: M, tree: tree)
print(result)