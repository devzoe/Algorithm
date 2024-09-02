import Foundation

func readInput() -> (Int, [[Int]]) {
    let N = Int(readLine()!)!
    var arr = [[Int]]()
    for _ in 0..<N {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        arr.append(line)
    }
    return (N, arr)
}

func solution(_ N: Int, _ arr: [[Int]]) {
    var minArr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)
    var maxArr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)
    
    for i in 0..<N {
        for j in 0..<3 {
            if i == 0 {
                minArr[i][j] = arr[i][j]
                maxArr[i][j] = arr[i][j]
            } else {
                if j == 0 {
                    minArr[i][j] = min(minArr[i-1][j], minArr[i-1][j+1]) + arr[i][j]
                    maxArr[i][j] = max(maxArr[i-1][j], maxArr[i-1][j+1]) + arr[i][j]
                } else if j == 1 {
                    let preMinArr = minArr[i-1]
                    let preMaxArr = maxArr[i-1]
                    minArr[i][j] = preMinArr.min()! + arr[i][j]
                    maxArr[i][j] = preMaxArr.max()! + arr[i][j]
                } else {
                    minArr[i][j] = min(minArr[i-1][j-1], minArr[i-1][j]) + arr[i][j]
                    maxArr[i][j] = max(maxArr[i-1][j-1], maxArr[i-1][j]) + arr[i][j]
                }
            }
        }
    }
    let min = minArr[N-1].min()!
    let max = maxArr[N-1].max()!
    print(max, min)
}

let (N, arr) = readInput()
solution(N, arr)