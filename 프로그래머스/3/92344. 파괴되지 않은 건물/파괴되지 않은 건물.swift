func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let N = board.count
    let M = board[0].count
    var newBoard = board
    var prefixSum = [[Int]](repeating:[Int](repeating:0,count:M+2),count:N+2)
    for s in skill {
        let type = s[0]
        let x1 = s[1]+1
        let y1 = s[2]+1
        let x2 = s[3]+1
        let y2 = s[4]+1
        let degree = s[5]
        
        prefixSum[x1][y1] = type == 1 ? prefixSum[x1][y1]-degree : prefixSum[x1][y1]+degree
        prefixSum[x1][y2+1] = type == 1 ? prefixSum[x1][y2+1]+degree : prefixSum[x1][y2+1]-degree
        prefixSum[x2+1][y1] = type == 1 ? prefixSum[x2+1][y1]+degree : prefixSum[x2+1][y1]-degree
        prefixSum[x2+1][y2+1] = type == 1 ? prefixSum[x2+1][y2+1]-degree : prefixSum[x2+1][y2+1]+degree
    }
    for i in 1..<N+1 {
        for j in 1..<M+1 {
            prefixSum[i][j] += prefixSum[i][j-1]
        }
    }
    for j in 1..<M+1 {
        for i in 1..<N+1 {
            prefixSum[i][j] += prefixSum[i-1][j]
        }
    }
    for i in 1..<N+1 {
        for j in 1..<M+1 {
            newBoard[i-1][j-1] += prefixSum[i][j]
        }
    }
    return newBoard.flatMap { $0 }.filter { $0 > 0 }.count
    
}