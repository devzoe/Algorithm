import Foundation

func compare(_ beginning: [[Int]], _ target: [[Int]], _ row: Int, _ col: Int) -> Bool {
    let n = beginning.count
    let m = beginning[0].count
    
    for r in 0..<n {
        for c in 0..<m {
            let diff = ((row >> r) % 2 + (col >> c) % 2) % 2
            if (beginning[r][c] + diff) % 2 != target[r][c] {
                return false
            }
        }
    }
    return true
}

func solution(_ beginning: [[Int]], _ target: [[Int]]) -> Int {
    let n = beginning.count
    let m = beginning[0].count
    let max = n * m + 1
    var answer = max
    
    for row in 0..<(1 << n) {
        for col in 0..<(1 << m) {
            let cnt = row.nonzeroBitCount + col.nonzeroBitCount
            if cnt < answer && compare(beginning, target, row, col) {
                answer = cnt
            }
        }
    }
    
    return answer < max ? answer : -1
}