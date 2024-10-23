import Foundation

func divide(_ count: Int, _ index: Int, _ N: Int, _ scores: [[Int]], _ selected: inout [Bool], _ result: inout Int) {
    if count == N / 2 {
        let diff = calculateDifference(N, scores, selected)
        result = min(result, diff)
        return
    }
    
    for i in index..<N {
        if !selected[i] {
            selected[i] = true
            divide(count + 1, i + 1, N, scores, &selected, &result)
            selected[i] = false
        }
    }
}

func calculateDifference(_ N: Int, _ scores: [[Int]], _ selected: [Bool]) -> Int {
    var team1 = 0
    var team2 = 0
    
    for i in 0..<N {
        for j in 0..<N {
            if selected[i] && selected[j] {
                team1 += scores[i][j]
            } else if !selected[i] && !selected[j] {
                team2 += scores[i][j]
            }
        }
    }
    
    return abs(team1 - team2)
}

func main() {
    let N = Int(readLine()!)!
    var scores: [[Int]] = []
    
    for _ in 0..<N {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        scores.append(row)
    }
    
    var selected = [Bool](repeating: false, count: N)
    var result = Int.max
    
    divide(0, 0, N, scores, &selected, &result)
    
    print(result)
}

main()
