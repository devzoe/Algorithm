import Foundation

let maxN = 50
var n = 0, m = 0, emptyPlace = 0, answer = Int.max
var map = [[Int]](repeating: [Int](repeating: 0, count: maxN), count: maxN)
var time = [[Int]](repeating: [Int](repeating: -1, count: maxN), count: maxN)
var selected = [Bool](repeating: false, count: 10)
var virus = [(Int, Int)]()
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

func minVal(_ a: Int, _ b: Int) -> Int {
    return a < b ? a : b
}

func input() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    n = nm[0]
    m = nm[1]
    
    for i in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        for j in 0..<n {
            map[i][j] = line[j]
            if map[i][j] == 0 {
                emptyPlace += 1
            } else if map[i][j] == 2 {
                virus.append((i, j))
            }
        }
    }
}

func spreadVirus(_ queue: inout [(Int, Int)]) {
    var infectPlace = 0
    var totalTime = 0
    
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0 && ny >= 0 && nx < n && ny < n {
                if map[nx][ny] != 1 && time[nx][ny] == -1 {
                    time[nx][ny] = time[x][y] + 1
                    if map[nx][ny] == 0 {
                        infectPlace += 1
                        totalTime = time[nx][ny]
                    }
                    queue.append((nx, ny))
                }
            }
        }
    }
    
    if infectPlace == emptyPlace {
        answer = minVal(answer, totalTime)
    }
}

func selectVirus(_ idx: Int, _ cnt: Int) {
    if cnt == m {
        var queue = [(Int, Int)]()
        time = [[Int]](repeating: [Int](repeating: -1, count: maxN), count: maxN)
        
        for i in 0..<virus.count {
            if selected[i] {
                let (vx, vy) = virus[i]
                queue.append((vx, vy))
                time[vx][vy] = 0
            }
        }
        
        spreadVirus(&queue)
        return
    }
    
    for i in idx..<virus.count {
        if selected[i] { continue }
        selected[i] = true
        selectVirus(i + 1, cnt + 1)
        selected[i] = false
    }
}

func solution() {
    selectVirus(0, 0)
    if answer == Int.max {
        print(-1)
    } else {
        print(answer)
    }
}

func solve() {
    input()
    solution()
}

solve()
