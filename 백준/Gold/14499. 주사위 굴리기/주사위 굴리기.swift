import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, x, y, k) = (input[0], input[1], input[2], input[3], input[4])

var board = [[Int]]()
let dx = [0, 0, -1, 1] 
let dy = [1, -1, 0, 0]
var dice = [0, 0, 0, 0, 0, 0]  

func turn(_ dir: Int) {
    let (a, b, c, d, e, f) = (dice[0], dice[1], dice[2], dice[3], dice[4], dice[5])
    switch dir {
    case 1:  // 동쪽
        dice[0] = d; dice[1] = b; dice[2] = a; dice[3] = f; dice[4] = e; dice[5] = c
    case 2:  // 서쪽
        dice[0] = c; dice[1] = b; dice[2] = f; dice[3] = a; dice[4] = e; dice[5] = d
    case 3:  // 북쪽
        dice[0] = e; dice[1] = a; dice[2] = c; dice[3] = d; dice[4] = f; dice[5] = b
    case 4:  // 남쪽
        dice[0] = b; dice[1] = f; dice[2] = c; dice[3] = d; dice[4] = a; dice[5] = e
    default:
        break
    }
}

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let commands = readLine()!.split(separator: " ").map { Int($0)! }

var nx = x
var ny = y

for command in commands {
    let direction = command - 1
    nx += dx[direction]
    ny += dy[direction]

    if nx < 0 || nx >= n || ny < 0 || ny >= m {
        nx -= dx[direction]
        ny -= dy[direction]
        continue
    }

    turn(command)

    if board[nx][ny] == 0 {
        board[nx][ny] = dice[5] 
    } else {
        dice[5] = board[nx][ny]  
        board[nx][ny] = 0
    }

    print(dice[0])
}
