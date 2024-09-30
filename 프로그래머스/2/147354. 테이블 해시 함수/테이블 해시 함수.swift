import Foundation

var column: Int = 0

func cmp(_ v1: [Int], _ v2: [Int]) -> Bool {
    if v1[column] == v2[column] {
        return v1[0] > v2[0]
    } else {
        return v1[column] < v2[column]
    }
}

func solution(_ data: [[Int]], _ col: Int, _ row_begin: Int, _ row_end: Int) -> Int {
    column = col - 1
    var sortedData = data.sorted(by: cmp)

    var answer = 0
    let len = sortedData[0].count

    for i in row_begin...row_end {
        var totalSum = 0
        for j in 0..<len {
            totalSum += sortedData[i - 1][j] % i
        }
        answer ^= totalSum
    }

    return answer
}