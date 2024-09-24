func isValid(_ nx: Int, _ ny: Int, _ x: Int, _ y: Int) -> Bool {
    if 0 <= x && x < nx && 0 <= y && y < ny {
        return true
    }
    return false
}

func main() {
    let direction = [(-1,0),(0,1),(1,0),(0,-1)]
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    let rcd = readLine()!.split(separator: " ").map { Int($0)! }
    var r = rcd[0], c = rcd[1], d = rcd[2]
    var map: [[Int]] = []
    for _ in 0..<n {
        let m = readLine()!.split(separator: " ").map { Int($0)! }
        map.append(m)
    }
    var result = 0
    loop: while true {
        if map[r][c] == 0 {
            map[r][c] = 2
            result += 1
        }
        var flag = true
        for next in direction {
            let i = r + next.0
            let j = c + next.1
            if isValid(n, m, i, j) && map[i][j] == 0 {
                flag = false
                break
            }
        }
        if flag {
            let back = (d + 2) % 4
            let nextR = r + direction[back].0
            let nextC = c + direction[back].1
            if isValid(n,m,nextR,nextC) && map[nextR][nextC] == 2 {
                r = nextR
                c = nextC
                continue loop
            } else {
                break loop
            }
        } else {
            while true {
                d = (d + 3) % 4
                let nextR = r + direction[d].0
                let nextC = c + direction[d].1
                if isValid(n,m,nextR,nextC) && map[nextR][nextC] == 0 {
                    r = nextR
                    c = nextC
                    continue loop
                } else { continue }
            }
        }
    }
    print(result)
}
main()