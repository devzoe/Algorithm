import Foundation

func readInput() -> (Int, Int, [[Int]], [(Int,Int)]) {
    let line = readLine()!.split(separator: " ").map { Int($0)!}
    let n = line[0], m = line[1]
    var queue = [(Int,Int)]()
    var map = Array(repeating: Array(repeating: -1, count: m), count: n)

    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        for j in 0..<m {
            if input[j] == 2 {
                queue.append((i,j))
                map[i][j] = 0
            }
            if input[j] == 0 {
                map[i][j] = 0
            }
        }
    }
    
    return (n, m, map, queue)
}
func bfs(n: Int, m: Int, map: inout [[Int]], queue: inout [(Int,Int)]) {
    let dy = [0,0,1,-1]
    let dx = [-1,1,0,0]
    
    while !queue.isEmpty {
        let now = queue.removeFirst()

        for i in 0..<4 {
            let moveY = dy[i] + now.0
            let moveX = dx[i] + now.1
            
            guard moveY >= 0 && moveY < n && moveX >= 0 && moveX < m else { continue }
            guard map[moveY][moveX] == -1 else { continue }
            
            map[moveY][moveX] = map[now.0][now.1] + 1
            
            queue.append((moveY,moveX))
        }
    }

    for i in map {
        i.forEach { print($0,terminator: " ") }
        print("")
    }
}

var (n, m, map, queue) = readInput()
bfs(n: n, m: m, map: &map, queue: &queue)