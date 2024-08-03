import Foundation

func readInput() -> [[Int]] {
    let N = Int(readLine()!)!
    var map = Array(repeating: Array(repeating: 0, count: N), count: N)

    for i in 0..<N {
        let line = readLine()!.map { Int(String($0))! }
        for j in 0..<line.count {
            map[i][j] = line[j]
        }
    }  
    return map
}

func dfs(map: inout [[Int]], start: (x: Int, y: Int)) -> Int {
    var stack = [start]
    map[start.x][start.y] = 0
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var out = 1
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        
        for i in 0..<dx.count {
            let nextX = node.x + dx[i]
            let nextY = node.y + dy[i]
            if nextX < 0 || nextX >= map.count || nextY < 0 || nextY >= map.count {
                continue
            } else {
                if map[nextX][nextY] == 1 {
                    map[nextX][nextY] = 0
                    stack.append((nextX, nextY))
                    out += 1
                }
            }
        }
    }
    return out
}

func solution(map: inout [[Int]]) -> [Int] {
    var answer = [Int]()
    var complexNumber = 0
    
    for i in 0..<map.count {
        for j in 0..<map.count {
            if map[i][j] == 1 {
                complexNumber += 1
                answer.append(dfs(map: &map, start: (i, j)))
            }
        }
    }
    
    print(complexNumber)
    print(answer.sorted().map { String($0) }.joined(separator: "\n"))
    
    return answer
}


var map = readInput()
solution(map: &map)