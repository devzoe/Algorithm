import Foundation

enum Direction: Int, CaseIterable {
    case up = 0, down, left, right
}

struct Queue<T> {
    private var elements: [T] = []
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
}

func solution(_ board: [[Int]]) -> Int {
    let nx = board[0].count
    let ny = board.count
    let path: [(dx: Int, dy: Int, direction: Direction)] = [
        (0, 1, .right),
        (-1, 0, .up),
        (0, -1, .left),
        (1, 0, .down)
    ]
    var costs = Array(repeating: Array(repeating: [Int](repeating: Int.max, count: 4), count: nx), count: ny)
    var queue = Queue<(x: Int, y: Int, cost: Int, direction: Direction)>()
    
    // 시작점에서 모든 방향으로 이동할 수 있게 초기화
    for initialDirection in Direction.allCases {
        costs[0][0][initialDirection.rawValue] = 0
        queue.enqueue((0, 0, 0, initialDirection))
    }

    while !queue.isEmpty {
        guard let (x, y, cost, currDirection) = queue.dequeue() else { break }

        for (dx, dy, newDirection) in path {
            let newX = x + dx
            let newY = y + dy

            if newX < 0 || newX >= ny || newY < 0 || newY >= nx || board[newX][newY] == 1 {
                continue
            }

            var newCost = cost + 100
            if currDirection != newDirection {
                newCost += 500
            }

            // 최소 비용 갱신
            if newCost < costs[newX][newY][newDirection.rawValue] {
                costs[newX][newY][newDirection.rawValue] = newCost
                queue.enqueue((newX, newY, newCost, newDirection))
            }
        }
    }
    
    // 도착점에 도달한 네 방향 중 최소 비용
    return costs[ny - 1][nx - 1].min() ?? Int.max
}
