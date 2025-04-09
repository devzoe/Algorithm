let n = Int(readLine()!)!
var caseCnt = 0

func dfs(_ row: Int, _ col: Int, _ diag1: Int, _ diag2: Int) {
    if row == n {
        caseCnt += 1
        return
    }

    var available = ((1 << n) - 1) & ~(col | diag1 | diag2)

    while available != 0 {
        let pick = available & -available 
        available -= pick
        dfs(row + 1, col | pick, (diag1 | pick) << 1, (diag2 | pick) >> 1)
    }
}

dfs(0, 0, 0, 0)
print(caseCnt)