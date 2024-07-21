import Foundation

func readInput() -> (Int, [Int]) {
    let N = Int(readLine()!)!
    var numbers = [Int]()
    for _ in 0..<N {
        let line = Int(readLine()!)!
        numbers.append(line)
    }
    return (N, numbers)
}

func solution(N: Int, numbers: [Int]) -> [Int] {
    var result = [Int]()
    var maxNum = numbers.max()!
    var D = [[Int]](repeating: [Int](repeating: 0, count: 4), count: maxNum+1)
    for i in 0...maxNum {
        if i < 1 {
            D[i][1] = 0
            D[i][2] = 0
            D[i][3] = 0
        } else if i == 1 {
            D[i][1] = 1
            D[i][2] = 0
            D[i][3] = 0
        } else if i == 2 {
            D[i][1] = (D[i-1][2] + D[i-1][3]) % 1000000009
            D[i][2] = 1
            D[i][3] = 0
        } else if i == 3 {
            D[i][1] = (D[i-1][2] + D[i-1][3]) % 1000000009
            D[i][2] = (D[i-2][1] + D[i-2][3]) % 1000000009
            D[i][3] = 1
        } else {
            D[i][1] = (D[i-1][2] + D[i-1][3]) % 1000000009
            D[i][2] = (D[i-2][1] + D[i-2][3]) % 1000000009
            D[i][3] = (D[i-3][1] + D[i-3][2]) % 1000000009
        }
    }
    for n in numbers {
        result.append((D[n].reduce( 0, + ))%1000000009)
    }
    return result
}

let (N, numbers) = readInput()
let result = solution(N: N, numbers: numbers)
for r in result {
    print(r)
}