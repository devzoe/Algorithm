import Foundation

func readInput() -> (Int, Int, [Int]) {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    let N = line[0], K = line[1]
    var ryan = readLine()!.split(separator: " ").compactMap { Int($0) }
    return (N, K, ryan)
}

func solution(N: Int, K: Int, ryan: inout [Int]) {
    var count = 0

    for i in 0..<N {
        if ryan[i] == 1 {
            ryan[count] = i
            count += 1
        }
    }

    if count < K {
        print(-1)
    } else {
        var length = 0
        var result = N
        var start = 0, end = K - 1
        while end < count {
            length = ryan[end] - ryan[start] + 1
            result = min(result, length)
            start += 1
            end += 1
        }
        print(result)
    }
}

var (N, K, ryan) = readInput()
solution(N: N, K: K, ryan: &ryan)