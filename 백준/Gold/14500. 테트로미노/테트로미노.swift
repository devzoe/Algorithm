import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0],nm[1])
var arr: [[Int]] = []
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(line)
}
let directions = [[(0,1),(0,2),(0,3)],[(1,0),(2,0),(3,0)],
                 [(0,1),(1,0),(1,1)],
                 [(1,0),(2,0),(2,1)],[(1,0),(2,0),(2,-1)],
                  [(0,1),(0,2),(-1,2)],[(1,0),(1,1),(1,2)],
                  [(0,1),(1,1),(2,1)],[(0,-1),(1,-1),(2,-1)],
                  [(-1,0),(-1,1),(-1,2)],[(0,1),(0,2),(1,2)],
                 [(1,0),(1,1),(2,1)],[(1,0),(1,-1),(2,-1)],
                  [(0,1),(-1,1),(-1,2)],[(0,1),(1,1),(1,2)],
                 [(0,1),(0,2),(1,1)],[(0,1),(-1,1),(0,2)],
                  [(1,0),(1,-1),(2,0)],[(1,0),(1,1),(2,0)]]
var maxValue = Int.min
for i in 0..<n {
    for j in 0..<m {
        let now = arr[i][j]
        for direction in directions {
            var cost = 0
            for d in direction {
                let x = i + d.0
                let y = j + d.1
                if 0 <= x && x < n && 0 <= y && y < m {
                    cost += arr[x][y]
                } else {
                    cost = 0
                    break
                }
            }
            maxValue = max(maxValue,cost+now)
        }
    }
}
print(maxValue)