import Foundation

// CCTV 감시 방향
func directions() -> [[[Int]]] {
    return [
        [],
        [[0], [1], [2], [3]], // 1번 CCTV: 상, 하, 좌, 우
        [[0, 1], [2, 3]], // 2번 CCTV: 좌우, 상하
        [[0, 2], [1, 2], [1, 3], [0, 3]], // 3번 CCTV: 상우, 우하, 하좌, 좌상
        [[0, 2, 3], [0, 1, 2], [1, 2, 3], [0, 1, 3]], // 4번 CCTV: 좌상우, 상우하, 우하좌, 하좌상
        [[0, 1, 2, 3]] // 5번 CCTV: 상하좌우
    ]
}

func moveVectors() -> ([Int], [Int]) {
    return ([-1, 1, 0, 0], [0, 0, -1, 1]) // 상, 하, 좌, 우
}

func monitor(x: Int, y: Int, office: inout [[Int]], dir: [Int], dx: [Int], dy: [Int]) {
    for d in dir {
        var nx = x
        var ny = y
        while true {
            nx += dx[d]
            ny += dy[d]
            if nx < 0 || nx >= office.count || ny < 0 || ny >= office[0].count || office[nx][ny] == 6 {
                break
            }
            if office[nx][ny] == 0 {
                office[nx][ny] = -1
            }
        }
    }
}

func search(office: [[Int]], cctvs: [(Int, Int, Int)], idx: Int, dirs: [[[Int]]], dx: [Int], dy: [Int]) -> Int {
    if idx == cctvs.count {
        return office.flatMap { $0 }.filter { $0 == 0 }.count
    }
    
    let (x, y, type) = cctvs[idx]
    var minBlind = Int.max
    
    for dir in dirs[type] {
        var newOffice = office
        monitor(x: x, y: y, office: &newOffice, dir: dir, dx: dx, dy: dy)
        minBlind = min(minBlind, search(office: newOffice, cctvs: cctvs, idx: idx + 1, dirs: dirs, dx: dx, dy: dy))
    }
    
    return minBlind
}

func solution() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    
    var office = [[Int]]()
    var cctvs = [(Int, Int, Int)]()
    
    for i in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        office.append(row)
        for j in 0..<m {
            if 1 <= row[j] && row[j] <= 5 {
                cctvs.append((i, j, row[j]))
            }
        }
    }
    
    let dirs = directions()
    let (dx, dy) = moveVectors()
    
    let result = search(office: office, cctvs: cctvs, idx: 0, dirs: dirs, dx: dx, dy: dy)
    print(result)
}

solution()
