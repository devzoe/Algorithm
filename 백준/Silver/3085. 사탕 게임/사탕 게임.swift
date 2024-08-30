func readInput() -> [[Character]] {
    let n = Int(readLine()!)!
    var board: [[Character]] = []
    for _ in 0..<n {
        if let line = readLine() {
            board.append(Array(line))
        }
    }
    return board
}

func solution(_ board: [[Character]]) -> Int {
    let n = board.count
    var maxCount = 0
    
    func count(_ line: [Character]) -> Int {
        var maxLen = 1
        var currentLen = 1
        for i in 1..<line.count {
            if line[i] == line[i-1] {
                currentLen += 1
                maxLen = max(maxLen, currentLen)
            } else {
                currentLen = 1
            }
        }
        return maxLen
    }
    
    func checkMax() {
        for i in 0..<n {
            maxCount = max(maxCount, count(board[i]))
            maxCount = max(maxCount, count(board.map { $0[i] }))
        }
    }
    
    func swap(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) {
        var newBoard = board
        let temp = newBoard[x1][y1]
        newBoard[x1][y1] = newBoard[x2][y2]
        newBoard[x2][y2] = temp
        
        for i in 0..<n {
            maxCount = max(maxCount, count(newBoard[i]))
            maxCount = max(maxCount, count(newBoard.map { $0[i] }))
        }
    }
    
    checkMax()
    
    for i in 0..<n {
        for j in 0..<n {
            if j+1 < n { swap(i, j, i, j+1) }
            if i+1 < n { swap(i, j, i+1, j) }
        }
    }
    
    return maxCount
}

let board = readInput() 
let result = solution(board)
print(result)