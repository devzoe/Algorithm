import Foundation

let directions = [(0,1), (1,0), (0,-1), (-1,0)]

func bfs(_ board: [[Int]], _ start: (Int, Int), _ target: (Int, Int)) -> Int {
    var queue = [(start.0, start.1, 0)]
    var visited = Array(repeating: Array(repeating: false, count: 4), count: 4)
    visited[start.0][start.1] = true
    
    while !queue.isEmpty {
        let (x, y, dist) = queue.removeFirst()
        
        if (x, y) == target {
            return dist
        }
        
        for (dx, dy) in directions {
            var nx = x + dx, ny = y + dy
            
            if (0..<4).contains(nx) && (0..<4).contains(ny) && !visited[nx][ny] {
                visited[nx][ny] = true
                queue.append((nx, ny, dist + 1))
            }
            
            while (0..<4).contains(nx) && (0..<4).contains(ny) && board[nx][ny] == 0 {
                nx += dx
                ny += dy
            }
            if !(0..<4).contains(nx) || !(0..<4).contains(ny) {
                nx -= dx
                ny -= dy
            }
            if !visited[nx][ny] {
                visited[nx][ny] = true
                queue.append((nx, ny, dist + 1))
            }
        }
    }
    return Int.max
}

func minMove(_ board: [[Int]], _ pos: (Int, Int), _ pairs: [(Int, (Int, Int), (Int, Int))], _ memo: inout [String: Int]) -> Int {
    if pairs.isEmpty { return 0 }
    
    let key = "\(pos)-\(pairs)"
    if let cachedResult = memo[key] {
        return cachedResult
    }
    
    var minOperations = Int.max
    var board = board
    
    for i in 0..<pairs.count {
        var remainingPairs = pairs
        let (card, pos1, pos2) = pairs[i]
        remainingPairs.remove(at: i)
        
        let dist1 = bfs(board, pos, pos1) + bfs(board, pos1, pos2)
        let dist2 = bfs(board, pos, pos2) + bfs(board, pos2, pos1)
        
        board[pos1.0][pos1.1] = 0
        board[pos2.0][pos2.1] = 0
        
        minOperations = min(minOperations, dist1 + minMove(board, pos2, remainingPairs, &memo) + 2)
        minOperations = min(minOperations, dist2 + minMove(board, pos1, remainingPairs, &memo) + 2)
        
        board[pos1.0][pos1.1] = card
        board[pos2.0][pos2.1] = card
    }
    
    memo[key] = minOperations
    return minOperations
}

func solution(_ board: [[Int]], _ r: Int, _ c: Int) -> Int {
    var cards = [Int: [(Int, Int)]]()
    
    for i in 0..<4 {
        for j in 0..<4 {
            if board[i][j] != 0 {
                if cards[board[i][j]] == nil {
                    cards[board[i][j]] = [(i, j)]
                } else {
                    cards[board[i][j]]!.append((i, j))
                }
            }
        }
    }
    
    var cardPairs = [(Int, (Int, Int), (Int, Int))]()
    for (card, positions) in cards {
        cardPairs.append((card, positions[0], positions[1]))
    }
    
    var memo = [String: Int]()
    return minMove(board, (r, c), cardPairs, &memo)
}
