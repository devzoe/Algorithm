import Foundation

func readInput() -> (Int, Int, [Int]) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let N = line[0]
    let M = line[1]
    let time = readLine()!.split(separator: " ").map { Int($0)! }
    
    return (N, M, time)
}

func solution(N: Int, M: Int, time: [Int]) -> Int {
    var result = 0
    var start = time.max()!
    var end = time.reduce(0, +)
    while start <= end {
        let mid = (start+end) / 2
        var totalTime = 0
        var count = 1
        for t in time {
            if totalTime + t > mid {
                count += 1
                totalTime = 0
            }
            totalTime += t
        }
        if count <= M {
            result = mid
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return result
}
 
let (N, M, time) = readInput()
let result = solution(N: N, M: M, time: time)
print(result)