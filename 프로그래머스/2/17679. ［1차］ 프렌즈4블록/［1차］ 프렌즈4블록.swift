func fill(_ m: Int, _ n: Int, _ board: inout [[Int]]) {
    for i in 0..<m {
        for j in 0..<n {
            for k in 0...m-1 {
                let dist = i-k
                if dist >= 0 && dist-1 >= 0 && board[dist][j] == 0 { 
                    board[dist][j] = board[dist-1][j]
                    board[dist-1][j] = 0
                }
            }
        }
    }
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    let direction = [[(-1,0),(-1,-1),(0,-1)],[(-1,0),(-1,1),(0,1)],[(1,0),(1,-1),(0,-1)],[(1,0),(1,1),(0,1)]]
    var copy: [[Int]] = []
    board.forEach {
        let b = $0.map { Int($0.asciiValue!) }
        copy.append(b)
    }
    var pre = copy
    var result = 0
    while true {
        for i in stride(from:1, through:m-1, by:2) {
            for j in stride(from:1, through:n-1, by:2) {
                let now = pre[i][j]
                if now == 0 { continue }
                for dd in direction {
                    var flag = true
                    for d in dd {
                        let x = i + d.0
                        let y = j + d.1
                        if 0 > x || x >= m || 0 > y || y >= n || now != pre[x][y] {
                            flag = false
                            break
                        } 
                    }
                    if flag {
                        if copy[i][j] != 0 {
                            copy[i][j] = 0
                            result += 1
                        }
                        for d in dd {
                            let x = i + d.0
                            let y = j + d.1
                            if copy[x][y] != 0 {
                                copy[x][y] = 0
                                result += 1
                            }
                        }
                    }
                }
            }
        }
        if pre == copy {
            break
        }
        fill(m,n,&copy)
        pre = copy
    }
    return result
}