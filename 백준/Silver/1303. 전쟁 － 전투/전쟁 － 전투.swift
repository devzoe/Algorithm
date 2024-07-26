import Foundation

// 더블 스택 큐
struct DoubleStackQueue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }

    mutating func enqueue(_ input: T) {
        inbox.append(input)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

func readInput() -> (Int, Int, [[Character]]) {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let N = firstLine[0]
    let M = firstLine[1]
    var map = [[Character]]()
    for _ in 0..<M {
        let line = Array(readLine()!)
        map.append(line)
    }
    return (N, M, map)
}

func isValid(x: Int, y: Int, nx: Int, ny: Int) -> Bool {
    if x < 0 || x >= nx || y < 0 || y >= ny {
        return false
    }
    return true
}

func bfs(x: Int, y: Int, nx: Int, ny: Int, visited: inout [[Bool]], map: [[Character]], alliedForces: inout Int, enemy: inout Int) {
    let direction = [[0,1], [0,-1], [1,0], [-1,0]]
    var queue = DoubleStackQueue<[Int]>()
    queue.enqueue([x,y])
    visited[x][y] = true
    var power = 0
    while !queue.isEmpty {
        let q = queue.dequeue()
        let currentX = q![0]
        let currentY = q![1]
        power += 1
        for d in direction {
            let dx = currentX+d[0]
            let dy = currentY+d[1]
            if isValid(x: dx, y: dy, nx: nx, ny: ny) {
                if !visited[dx][dy] {
                    if map[currentX][currentY] == map[dx][dy] {
                        queue.enqueue([dx,dy])
                        visited[dx][dy] = true
                    }
                }
            }
        }
    }
    if map[x][y] == "W" {
        alliedForces += power * power
    } else {
        enemy += power * power
    }
}

let (N, M, map) = readInput()
var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)
var alliedForces = 0
var enemyForces = 0
var currentPower = 0

for i in 0..<M {
    for j in 0..<N {
        if !visited[i][j] {
            bfs(x: i, y: j, nx: M, ny: N, visited: &visited, map: map, alliedForces: &alliedForces, enemy: &enemyForces)
        }
    }
}

print(alliedForces, enemyForces)
