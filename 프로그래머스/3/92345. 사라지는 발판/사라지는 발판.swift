import Foundation

func solution(_ board: [[Int]], _ aLoc: [Int], _ bLoc: [Int]) -> Int {
    let row = board.count
    let col = board[0].count
    let dr = [-1, 0, 1, 0]
    let dc = [0, 1, 0, -1]

    func isValid(_ r: Int, _ c: Int) -> Bool {
        return 0 <= r && r < row && 0 <= c && c < col
    }

    func play(_ a: [Int], _ b: [Int], _ visited: Set<[Int]>, _ turn: Int) -> (Bool, Int) {
        let (r, c) = (turn % 2 == 0) ? (a[0], a[1]) : (b[0], b[1])
        var move = false
        var w = true
        var winStep: [Int] = []
        var loseStep: [Int] = []

        for i in 0..<4 {
            let nr = r + dr[i]
            let nc = c + dc[i]
            if isValid(nr, nc), !visited.contains([nr, nc]), board[nr][nc] == 1 {
                move = true
                if a == b {
                    return (true, turn + 1)
                }

                let (win, step) = turn % 2 == 0
                    ? play([nr, nc], b, visited.union([[r, c]]), turn + 1)
                    : play(a, [nr, nc], visited.union([[r, c]]), turn + 1)

                w = w && win
                if win {
                    winStep.append(step)
                } else {
                    loseStep.append(step)
                }
            }
        }

        if !move {
            return (false, turn)
        }
        if w {
            return (false, winStep.max() ?? turn)
        }
        return (true, loseStep.min() ?? turn)
    }

    let (_, step) = play(aLoc, bLoc, Set(), 0)
    return step
}
