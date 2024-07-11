import Foundation

let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let HW = readLine()!.split(separator: " ").map { Int($0)! }
let height = HW[0]
let width = HW[1]

var sea = [[Int]]()
for _ in 0..<height {
    sea.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var year = 0

func main() {
    while true {
        var isAllIcebergMelted = false
        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
        
        let isSeparated = detectIcebergs(visited: &visited, allIcebergMelted: &isAllIcebergMelted)
        
        if !isSeparated {
            meltIcebergs()
        } else {
            year = isAllIcebergMelted ? 0 : year
            break
        }
        year += 1
    }

    print(year)
}

//빙산 덩어리
func detectIcebergs(visited: inout [[Bool]], allIcebergMelted: inout Bool) -> Bool {
    var icebergCount = 0

    for y in 0..<height {
        for x in 0..<width {
            if sea[y][x] != 0 && !visited[y][x] {
                dfs(x: x, y: y, isMelt: false, visited: &visited)
                icebergCount += 1
                if icebergCount > 1 {
                    return true
                }
            }
        }
    }

    if icebergCount == 0 {
        allIcebergMelted = true
        return true
    }
    return false
}

func meltIcebergs() {
    var visited = Array(repeating: Array(repeating: false, count: width), count: height)

    for y in 0..<height {
        for x in 0..<width {
            if sea[y][x] != 0 {
                dfs(x: x, y: y, isMelt: true, visited: &visited)
                return
            }
        }
    }
}

func dfs(x: Int, y: Int, isMelt: Bool, visited: inout [[Bool]]) {
    visited[y][x] = true
    var surroundingSeaCount = 0

    for (dx, dy) in directions {
        let nx = x + dx
        let ny = y + dy

        if nx >= 0 && nx < width && ny >= 0 && ny < height {
            if sea[ny][nx] == 0 && isMelt {
                if !visited[ny][nx] {
                    surroundingSeaCount += 1
                }
            }
            if sea[ny][nx] != 0 && !visited[ny][nx] {
                dfs(x: nx, y: ny, isMelt: isMelt, visited: &visited)
            }
        }
    }

    if isMelt {
        sea[y][x] -= surroundingSeaCount
        if sea[y][x] < 0 {
            sea[y][x] = 0
        }
    }
}

main()
