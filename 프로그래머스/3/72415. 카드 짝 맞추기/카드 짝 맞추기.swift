import Foundation

struct Position: Hashable {
    let x: Int
    let y: Int
}

func moveCost(_ board: [[Int]], _ start: Position, _ end: Position) -> Int {
    if start == end { return 0 }

    var queue: [(Position, Int)] = [(start, 0)]
    var visit: Set<Position> = [start]

    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

    while !queue.isEmpty {
        let (current, cost) = queue.removeFirst()
        let (x, y) = (current.x, current.y)

        for (dx, dy) in directions {
            var nx = x + dx, ny = y + dy
            var cx = x, cy = y

            while true {
                cx += dx
                cy += dy
                if !(0...3).contains(cx) || !(0...3).contains(cy) {
                    cx -= dx
                    cy -= dy
                    break
                } else if board[cx][cy] != 0 {
                    break
                }
            }

            let normalMove = Position(x: nx, y: ny)
            let ctrlMove = Position(x: cx, y: cy)

            if normalMove == end || ctrlMove == end {
                return cost + 1
            }

            if (0...3).contains(nx) && (0...3).contains(ny) && !visit.contains(normalMove) {
                queue.append((normalMove, cost + 1))
                visit.insert(normalMove)
            }

            if !visit.contains(ctrlMove) {
                queue.append((ctrlMove, cost + 1))
                visit.insert(ctrlMove)
            }
        }
    }

    return Int.max
}

func clearCost(_ board: [[Int]], _ cardDict: [Int: [Position]], _ curr: Position, _ order: [Int], _ cost: Int) -> Int {
    if order.isEmpty { return cost }
    let idx = order[0] + 1
    let pos1 = cardDict[idx]![0]
    let pos2 = cardDict[idx]![1]
    let choice1 = moveCost(board, curr, pos1) + moveCost(board, pos1, pos2) + 2
    let choice2 = moveCost(board, curr, pos2) + moveCost(board, pos2, pos1) + 2

    var newBoard = board
    newBoard[pos1.x][pos1.y] = 0
    newBoard[pos2.x][pos2.y] = 0

    if choice1 < choice2 {
        return clearCost(newBoard, cardDict, pos2, Array(order.dropFirst()), cost + choice1)
    } else {
        return clearCost(newBoard, cardDict, pos1, Array(order.dropFirst()), cost + choice2)
    }
}

func solution(_ board: [[Int]], _ r: Int, _ c: Int) -> Int {
    var cardDict: [Int: [Position]] = [:]

    for row in 0..<4 {
        for col in 0..<4 {
            let num = board[row][col]
            if num != 0 {
                if cardDict[num] == nil {
                    cardDict[num] = []
                }
                cardDict[num]?.append(Position(x: row, y: col))
            }
        }
    }

    let cardCount = cardDict.keys.count
    var minCost = Int.max

    func permutations<T>(_ array: [T], _ n: Int) -> [[T]] {
        if n == 1 { return array.map { [$0] } }
        var result: [[T]] = []
        for (i, element) in array.enumerated() {
            var rest = array
            rest.remove(at: i)
            result += permutations(rest, n - 1).map { [element] + $0 }
        }
        return result
    }

    let cases = permutations(Array(0..<cardCount), cardCount)

    for order in cases {
        minCost = min(minCost, clearCost(board, cardDict, Position(x: r, y: c), order, 0))
    }

    return minCost
}
