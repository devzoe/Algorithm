import Foundation

func readInput() -> (Int, Int) {
    let N = Int(readLine()!)!
    let k = Int(readLine()!)!
    return (N, k)
}

func solution(_ N: Int, _ k: Int) {
    var left = 1
    var right = N * N
    var result = 0

    while left <= right {
        let mid = (left + right) / 2
        var count = 0

        for i in 1...N {
            count += min(mid / i, N)
        }

        if count >= k {
            result = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    print(result)
}

let (N, k) = readInput()
solution(N, k)
