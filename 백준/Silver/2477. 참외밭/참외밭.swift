import Foundation

let n = 6

func readInput() -> (Int, Int, Int, [[Int]]) {
    let N = Int(readLine()!)!
    var directions = [[Int]]()

    for i in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        directions.append(line)
    }
    var dict : [Int:Int] = [:]
    var length = [Int](repeating: 0, count: 5)
    for i in 0..<n {
        let direction = directions[i][0]
        if let value = dict[direction] {
            dict[direction] = value + 1
        } else {
            dict[direction] = 1
            length[direction] = directions[i][1]
        }
        directions.append(directions[i])
    }
    let horizontal = dict[1]! > dict[2]! ? length[2] : length[1]
    let vertical = dict[3]! > dict[4]! ? length[4] : length[3]
    
    return (N, horizontal, vertical, directions)
}

func countMelon(N: Int, horizontal: Int, vertical: Int, directions: [[Int]]) -> Int {
    var removed1 = 0
    var removed2 = 0
    for i in 2..<2*n {
        if directions[i][0] == directions[i-2][0] && directions[i+1][0] == directions[i-1][0] {
            removed1 = directions[i-1][1]
            removed2 = directions[i][1]
            break
        }
    }
    let result = (horizontal * vertical) - (removed1 * removed2)
    return result
}

let (N, horizontal, vertical, directions) = readInput()
let result = countMelon(N: N, horizontal: horizontal, vertical: vertical, directions: directions)
print(result*N)