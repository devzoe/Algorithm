import Foundation

func readInput() -> ([Int],[Int]) {
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
    var AB = [Int]()
    var CD = [Int]()
    for i in 0..<N {
        for j in 0..<N {
            AB.append(A[i] + B[j])
            CD.append(C[i] + D[j])
        }
    }
    AB.sort()
    CD.sort()
    return (AB, CD)
}
func solution(AB: [Int], CD: [Int]) -> Int {
    var x = 0
    var y = CD.count - 1
    var result = 0
    while x < AB.count && y >= 0 {
        if AB[x] + CD[y] == 0 {
            var nextX = x + 1
            var nextY = y - 1
            while nextX < AB.count && AB[x] == AB[nextX]{
                nextX += 1
            }
            while nextY >= 0 && CD[y] == CD[nextY] {
                nextY -= 1
            }
            result += (nextX - x) * (y - nextY)
            x = nextX
            y = nextY
        }
        else if AB[x] + CD[y] > 0 {
            y -= 1
        }
        else {
            x += 1
        }
    }
    return result
}

let (AB, CD) = readInput()
let result = solution(AB: AB, CD: CD)
print(result)
