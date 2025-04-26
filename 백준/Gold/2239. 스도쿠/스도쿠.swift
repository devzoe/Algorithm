import Foundation

var map = Array(repeating: Array(repeating: 0, count: 10), count: 10)
var empties = [(Int, Int)]()

func printNumber() {
    for i in 1...9 {
        for j in 1...9 {
            print(map[i][j], terminator: "")
        }
        print()
    }
}

func isPossible(x: Int, y: Int, k: Int) -> Bool {
    for i in 1...9 {
        if map[x][i] == k && i != y {
            return false
        }
        if map[i][y] == k && i != x {
            return false
        }
        let nx = (x - 1) / 3 * 3 + 1 + (i - 1) / 3
        let ny = (y - 1) / 3 * 3 + 1 + (i - 1) % 3
        if map[nx][ny] == k && !(nx == x && ny == y) {
            return false
        }
    }
    return true
}

var isFinished = false
func backTracking(idx: Int) {
    if isFinished { return }

    if idx == empties.count {
        printNumber()
        isFinished = true
        return
    }

    let (x, y) = empties[idx]
    for k in 1...9 {
        if isPossible(x: x, y: y, k: k) {
            map[x][y] = k
            backTracking(idx: idx + 1)
            map[x][y] = 0
        }
    }
}

func main() {
    for i in 1...9 {
        if let input = readLine() {
            let line = Array(input)
            for j in 1...9 {
                if let num = Int(String(line[j - 1])) {
                    map[i][j] = num
                    if num == 0 {
                        empties.append((i, j))
                    }
                }
            }
        }
    }
    backTracking(idx: 0)
}

main()