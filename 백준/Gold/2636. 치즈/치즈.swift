import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)!}
let (n,m) = (nm[0],nm[1])
var arr: [[Int]] = []
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)!}
    arr.append(line)
}

func check(_ state: Int) {
    var queue: [(Int,Int)] = [(0,0)]
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    let direction = [(0,1),(1,0),(-1,0),(0,-1)]
    while !queue.isEmpty {
        let (x,y) = queue.removeFirst()
        visited[x][y] = true
        for d in direction {
            let nextX = x+d.0
            let nextY = y+d.1
            if 0 <= nextX && nextX < n && 0 <= nextY && nextY < m && !visited[nextX][nextY] && arr[nextX][nextY] != 1 {
                visited[nextX][nextY] = true
                queue.append((nextX,nextY))
                if arr[nextX][nextY] == 0 {
                    arr[nextX][nextY] = state
                }
            }
        }
    }
}
func change(_ state: Int, _ ans: inout Int) {
    var queue: [(Int,Int)] = [(0,0)]
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    let direction = [(0,1),(1,0),(-1,0),(0,-1)]
    while !queue.isEmpty {
        let (x,y) = queue.removeFirst()
        visited[x][y] = true
        for d in direction {
            let nextX = x+d.0
            let nextY = y+d.1
            if 0 <= nextX && nextX < n && 0 <= nextY && nextY < m && !visited[nextX][nextY] && arr[nextX][nextY] != 0 {
                visited[nextX][nextY] = true
                queue.append((nextX,nextY))
                var flag = false
                if arr[nextX][nextY] == 1 {
                    for dd in direction {
                        let dx = nextX+dd.0
                        let dy = nextY+dd.1
                        if 0 <= dx && dx < n && 0 <= dy && dy < m && arr[dx][dy] == state {
                            flag = true
                            break
                        }
                    }
                }
                if flag {
                    arr[nextX][nextY] = state+1
                    ans += 1
                }
            }
        }
    }
}

func arrCnt() -> Int {
    var cnt = 0
    for i in 0..<n {
        for j in 0..<m {
            if arr[i][j] != 1 {
                cnt += 1
            }
        }
    }
    return cnt
}

var i = 2
var ans = 0
while arrCnt() != n*m {
    ans = 0
    check(i)
    change(i,&ans)
    i += 1
}
print(i-2)
print(ans)