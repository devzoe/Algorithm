import Foundation

var N = 0
var M = 0
var visit = Array(repeating: Array(repeating: Array(repeating: false, count: 4), count: 510), count: 510)
var map: [String] = []

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

func changeDir(_ c: Character, _ dir: Int) -> Int {
    if c == "L" {
        if dir == 0 { return 3 }
        if dir == 1 { return 2 }
        if dir == 2 { return 0 }
        if dir == 3 { return 1 }
    }
    // R인 경우
    if dir == 0 { return 2 }
    if dir == 1 { return 3 }
    if dir == 2 { return 1 }
    if dir == 3 { return 0 }
    
    return dir
}

func simulation(_ x: Int, _ y: Int, _ dir: Int, _ len: Int) -> Int {
    if visit[x][y][dir] { return len }
    
    visit[x][y][dir] = true
    
    var nx = x
    var ny = y
    var nd = dir
    
    if map[x][map[x].index(map[x].startIndex, offsetBy: y)] != "S" {
        nd = changeDir(map[x][map[x].index(map[x].startIndex, offsetBy: y)], dir)
    }
    
    nx = x + dx[nd]
    ny = y + dy[nd]
    
    if nx < 0 { nx = N - 1 }
    if ny < 0 { ny = M - 1 }
    if nx == N { nx = 0 }
    if ny == M { ny = 0 }
    
    return simulation(nx, ny, nd, len + 1)
}

func solution(_ grid: [String]) -> [Int] {
    var answer: [Int] = []
    N = grid.count
    M = grid[0].count
    map = grid
    
    for i in 0..<N {
        for j in 0..<M {
            for k in 0..<4 {
                let result = simulation(i, j, k, 0)
                if result != 0 {
                    answer.append(result)
                }
            }
        }
    }
    
    return answer.sorted()
}
