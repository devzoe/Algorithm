import Foundation

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func readInput() -> ([[Int]], Int, Int) {
    let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = mn[0]
    let n = mn[1]
    var arr: [[Int]] = []
    
    for _ in 1...n {
        arr.append(readLine()!.map { Int(String($0))! })
    }
    
    return (arr, n, m)
}

func bfs(_ arr: [[Int]], _ n: Int, _ m: Int) -> Int {
    var dist = Array(repeating: Array(repeating: Int.max, count: m), count: n)
    var queue: [(Int, Int)] = []
    
    queue.append((0, 0))
    dist[0][0] = 0
    
    while !queue.isEmpty {
        let pop = queue.removeFirst()

        for i in 0..<4 {
            let nx = pop.0 + dx[i]
            let ny = pop.1 + dy[i]
            
            if nx >= 0 && nx < n && ny >= 0 && ny < m {
                if arr[nx][ny] == 1 {
                    if dist[nx][ny] > dist[pop.0][pop.1] + 1 {
                        dist[nx][ny] = dist[pop.0][pop.1] + 1
                        queue.append((nx, ny))
                    }
                } else if arr[nx][ny] == 0 {
                    if dist[nx][ny] > dist[pop.0][pop.1] {
                        dist[nx][ny] = dist[pop.0][pop.1]
                        queue.append((nx, ny))
                    }
                }
            }
        }
    }
    
    return dist[n-1][m-1]
}


let (arr, n, m) = readInput()
let result = bfs(arr, n, m)
print(result)