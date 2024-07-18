import Foundation

let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

func readInput() -> (Int, Int, [[Int]]) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let R = input[0]
    let C = input[1]
        
    var board = [[Int]]()
    for _ in 0..<R {
        let line = readLine()!.map { Int($0.asciiValue!) - 65 }
        board.append(line)
    }
    
    return (R, C, board)
}


func dfs(x: Int, y: Int, count: Int, bit: Int, R: Int, C: Int, board: [[Int]], result: inout Int) {
    result = max(result, count)
    
    for direction in directions {
        let nx = x + direction.0
        let ny = y + direction.1
        
        if nx >= 0 && nx < R && ny >= 0 && ny < C {
            let newBit = 1 << board[nx][ny]
            if bit & newBit == 0 {
                dfs(x: nx, y: ny, count: count + 1, bit: bit | newBit, R: R, C: C, board: board, result: &result)
            }
        }
    }
}

func main() {
    let (R, C, board) = readInput()
    var result = 0
    
    let startBit = 1 << board[0][0]
    dfs(x: 0, y: 0, count: 1, bit: startBit, R: R, C: C, board: board, result: &result)
    
    print(result)
}

main()