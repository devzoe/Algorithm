import Foundation

var result = [0, 0]
var paper: [[Int]] = []

func div(_ y: Int, _ x: Int, _ n: Int) {
    let color = paper[y][x]
    
    for i in y..<y + n {
        for j in x..<x + n {
            if paper[i][j] != color {
                let m = n / 2
                div(y, x, m)             // 2사분면
                div(y, x + m, m)         // 1사분면
                div(y + m, x, m)         // 3사분면
                div(y + m, x + m, m)     // 4사분면
                return
            }
        }
    }
    
    result[color] += 1
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    paper.append(row)
}

div(0, 0, n)
print(result[0])
print(result[1])