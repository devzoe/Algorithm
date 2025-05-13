import Foundation

func combination(_ n: Int, _ r: Int) -> [[Int]] {
    let arr = Array(1...n)
    var result: [[Int]] = []
    func backtrack(_ idx: Int, _ ans: inout [Int]) {
        if ans.count == r {
            result.append(ans)
            return
        }
        for i in idx..<n {
            ans.append(arr[i])
            backtrack(i+1, &ans)
            ans.removeLast()
        }
    }
    var ans: [Int] = []
    backtrack(0, &ans)
    return result
}

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    let combinations = combination(n,5)
    var result = 0
    loop: for combi in combinations {
        for i in 0..<q.count {
            var check = 0
            for j in 0..<5 {
                for k in 0..<5{
                    if q[i][j] == combi[k] { check += 1 }
                }
            }
            if check != ans[i] { continue loop }
        }
        result += 1
    }
    
    return result
}