import Foundation

func readInput() -> (Int, Int, Int, [(Int, Int, Int)]) {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = line[0], K = line[1], D = line[2]
    
    var list = [(Int, Int, Int)]()
    for _ in 0..<K {
        let q = readLine()!.split(separator: " ").map { Int(String($0))! }
        list.append((q[0], q[1], q[2]))
    }
    
    list.sort { $0.0 < $1.0 }
    return (N, K, D, list)
}

func solution(_ N: Int, _ K: Int, _ D: Int, _ list: [(Int, Int, Int)]) {
    var start = 1
    var end = N
    var result = 0

    while start <= end {
        let mid = (start + end) / 2
        var sum = 0
        
        for i in 0..<K {
            let (l, r, step) = list[i]
            if l > mid { break }
            sum += ((min(r, mid) - l) / step + 1)
            if sum >= D { break }
        }
        
        if sum >= D {
            result = mid
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    print(result)
}

let (N, K, D, list) = readInput()
solution(N, K, D, list)