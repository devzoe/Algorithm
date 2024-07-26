import Foundation

func readInput() -> ([Int],[Int],[Int],[Int]) {
    let N = Int(readLine()!)!
    var A = [Int]()
    var B = [Int]()
    var C = [Int]()
    var D = [Int]()
    for _ in 0..<N {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        A.append(line[0])
        B.append(line[1])
        C.append(line[2])
        D.append(line[3])
    }
    return (A,B,C,D)
}
func solution(A: [Int], B: [Int], C: [Int], D: [Int]) -> Int {
    var dict: [Int:Int] = [:]
    var result = 0
    for a in A {
        for b in B {
            let n = a + b
            if dict.keys.contains(n) {
                dict[n]! += 1
            } else {
                dict[n] = 1
            }
        }
    }
    for c in C {
        for d in D {
            let n = -1 * (c + d)
            if dict.keys.contains(n) {
                result += dict[n]!
            }
        }
    }
    return result
}

let (A, B, C, D) = readInput()
let result = solution(A: A, B: B, C: C, D: D)
print(result)