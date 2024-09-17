import Foundation

func readInput() -> (Int, Int, [Int]) {
    let kn = readLine()!.split(separator: " ").map { Int($0)! }
    let k = kn[0], n = kn[1]
    var arr: [Int] = []
    for _ in 0..<k {
        arr.append(Int(readLine()!)!)
    }
    return (k, n, arr)
}

func solution(_ k: Int, _ n: Int, _ arr: [Int]) -> Int {
    var start = 1
    var end = arr.max()!
    var result = 0
    while start <= end {
        let mid = (start + end) / 2
        var cnt = 0
        for a in arr {
            cnt += a / mid
        }
        if cnt >= n {
            result = max(result, mid)
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return result
}

func main() {
    let (k, n, arr) = readInput()
    let result = solution(k, n, arr)
    print(result)
}
main()
