import Foundation

func solution(n: Int, k: Int, ranges: [(Int, Int)]) -> (Int, Int) {
    var vertical = [Int](repeating: 0, count: 1_000_001)

    for (start, end) in ranges {
        for i in start..<end {
            vertical[i] += 1
        }
    }

    var l = 0
    var r = 0
    var val = 0
    var flag = false

    while l <= r && r <= 1_000_000 {
        if val == k {
            flag = true
            break
        } else if val < k {
            val += vertical[r]
            r += 1
        } else {
            val -= vertical[l]
            l += 1
        }
    }

    return flag ? (l, r) : (0, 0)
}

func main() {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let n = firstLine[0]
    let k = firstLine[1]

    var ranges = [(Int, Int)]()
    for _ in 0..<n {
        let range = readLine()!.split(separator: " ").map { Int($0)! }
        ranges.append((range[0], range[1]))
    }

    let result = solution(n: n, k: k, ranges: ranges)
    print(result.0, result.1, separator: " ")
}

main()
