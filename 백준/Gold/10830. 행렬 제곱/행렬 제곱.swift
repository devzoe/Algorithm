import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, b) = (input[0], Int64(input[1]))

var a: [[Int]] = []
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! % 1000 }
    a.append(row)
}

func matrixMultiply(_ m1: [[Int]], _ m2: [[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            var sum = 0
            for k in 0..<n {
                sum += (m1[i][k] * m2[k][j]) % 1000
            }
            result[i][j] = sum % 1000
        }
    }
    return result
}

func matrixPower(_ matrix: [[Int]], _ exp: Int64) -> [[Int]] {
    if exp == 1 {
        return matrix.map { $0.map { $0 % 1000 } }
    }

    let half = matrixPower(matrix, exp / 2)
    let squared = matrixMultiply(half, half)

    if exp % 2 == 0 {
        return squared
    } else {
        return matrixMultiply(squared, matrix)
    }
}

let result = matrixPower(a, b)
for row in result {
    print(row.map { String($0) }.joined(separator: " "))
}
