import Foundation

let n = Int(readLine()!)!
var area: [[Int]] = []
var maxHeight = -1
for _ in 0..<n {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    maxHeight = arr.max()!
    area.append(arr)
}


let direction = [(0,1), (0,-1), (1,0), (-1,0)]
var maxResult = -1
for height in stride(from: maxHeight, through: 0, by: -1) {
    var result = 0
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    for x in 0..<n {
        for y in 0..<n {
            if area[x][y] <= height { continue }
            if visited[x][y] == true { continue }
            result += 1
            search(x, y)
        }
    }
    
    func search(_ x: Int, _ y: Int) {
        visited[x][y] = true
        for d in direction {
            let nextX = x + d.0
            let nextY = y + d.1
            if 0 <= nextX && nextX < n && 0 <= nextY && nextY < n && area[nextX][nextY] > height && !visited[nextX][nextY] {
                visited[nextX][nextY] = true
                search(nextX, nextY)
            }
        }
    }
    maxResult = max(result, maxResult)
}

print(maxResult)