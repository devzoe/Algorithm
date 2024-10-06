import Foundation

struct Step {
    var Rx: Int
    var Ry: Int
    var Bx: Int
    var By: Int
    var Count: Int
}

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var map = [[Character]](repeating: [Character](repeating: "#", count: 11), count: 11)
var visit = Array(repeating: Array(repeating: Array(repeating: Array(repeating: false, count: 11), count: 11), count: 11), count: 11)

var N = 0
var M = 0

func move(_ rx: inout Int, _ ry: inout Int, _ distance: inout Int, _ i: Int) {
    while map[rx + dx[i]][ry + dy[i]] != "#" && map[rx][ry] != "O" {
        rx += dx[i]
        ry += dy[i]
        distance += 1
    }
}

func bfs(_ Rx: Int, _ Ry: Int, _ Bx: Int, _ By: Int) {
    var queue = [Step]()
    queue.append(Step(Rx: Rx, Ry: Ry, Bx: Bx, By: By, Count: 0))
    visit[Rx][Ry][Bx][By] = true

    var index = 0
    while index < queue.count {
        let current = queue[index]
        index += 1

        let (rx, ry, bx, by, count) = (current.Rx, current.Ry, current.Bx, current.By, current.Count)
        if count >= 10 {
            break
        }

        for i in 0..<4 {
            var nrx = rx, nry = ry, nbx = bx, nby = by
            var rc = 0, bc = 0
            let ncount = count + 1

            move(&nrx, &nry, &rc, i)
            move(&nbx, &nby, &bc, i)

            if map[nbx][nby] == "O" {
                continue
            }
            if map[nrx][nry] == "O" {
                print(ncount)
                return
            }

            if nrx == nbx && nry == nby {
                if rc > bc {
                    nrx -= dx[i]
                    nry -= dy[i]
                } else {
                    nbx -= dx[i]
                    nby -= dy[i]
                }
            }

            if visit[nrx][nry][nbx][nby] {
                continue
            }
            visit[nrx][nry][nbx][nby] = true
            queue.append(Step(Rx: nrx, Ry: nry, Bx: nbx, By: nby, Count: ncount))
        }
    }
    print(-1)
}

func main() {
    if let firstLine = readLine() {
        let input = firstLine.split(separator: " ").map { Int($0)! }
        N = input[0]
        M = input[1]
    }

    var Rx = 0, Ry = 0, Bx = 0, By = 0

    for i in 0..<N {
        if let line = readLine() {
            let row = Array(line)
            for j in 0..<M {
                map[i][j] = row[j]
                if map[i][j] == "R" {
                    Rx = i
                    Ry = j
                } else if map[i][j] == "B" {
                    Bx = i
                    By = j
                }
            }
        }
    }
    bfs(Rx, Ry, Bx, By)
}

main()
