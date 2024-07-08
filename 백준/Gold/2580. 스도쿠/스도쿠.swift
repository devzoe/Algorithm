import Foundation

func readSudoku() -> ([[Int]], [[Int]]) {
    var sudoku = [[Int]]()
    var blank = [[Int]]()

    // 입력 받기
    for _ in 0..<9 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        sudoku.append(input)
    }

    // 빈칸 조사
    for i in 0..<9 {
        for j in 0..<9 {
            if sudoku[i][j] == 0 {
                blank.append([i, j])
            }
        }
    }
    return (sudoku, blank)
}

// 가로, 세로 판별
func isValidInLine(_ n: Int, _ i: Int, _ j: Int, sudoku: [[Int]]) -> Bool {
    for k in 0..<9 {
        if sudoku[i][k] == n || sudoku[k][j] == n {
            return false
        }
    }
    return true
}

// 사각형 판별
func isValidInSquare(_ n: Int, _ i: Int, _ j: Int, sudoku: [[Int]]) -> Bool {
    for k in 0..<3 {
        for l in 0..<3 {
            if sudoku[i/3*3+k][j/3*3+l] == n {
                return false
            }
        }
    }
    return true
}

func solveSudoku(_ sudoku: inout [[Int]], _ blank: [[Int]], _ depth: Int) {
    if depth == blank.count {
        for line in sudoku {
            print(line.map { String($0) }.joined(separator: " "))
        }
        exit(0)
    }
    
    for i in 1...9 {
        let y = blank[depth][0]
        let x = blank[depth][1]
        
        if isValidInLine(i, y, x, sudoku: sudoku) && isValidInSquare(i, y, x, sudoku: sudoku) {
            sudoku[y][x] = i
            solveSudoku(&sudoku, blank, depth + 1)
            sudoku[y][x] = 0
        }
    }
}

let (sudoku, blank) = readSudoku()
var mutableSudoku = sudoku
solveSudoku(&mutableSudoku, blank, 0)