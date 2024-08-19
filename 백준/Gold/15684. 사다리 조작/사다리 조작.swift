import Foundation

func min(_ A: Int, _ B: Int) -> Int {
    return A < B ? A : B
}

func input() -> (Int, Int, Int, [[Bool]]) {
    let inputValues = readLine()!.split(separator: " ").map { Int($0)! }
    let n = inputValues[0]
    let m = inputValues[1]
    let h = inputValues[2]
    
    var map = [[Bool]](repeating: [Bool](repeating: false, count: 31), count: 12)
    
    for _ in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let a = line[0]
        let b = line[1]
        map[b][a] = true
    }
    
    return (n, m, h, map)
}

func ladderGame(n: Int, h: Int, map: [[Bool]]) -> Bool {
    for i in 1...n {
        var currentNum = i
        for j in 1...h {
            if map[currentNum][j] {
                currentNum += 1
            } else if map[currentNum - 1][j] {
                currentNum -= 1
            }
        }
        if currentNum != i {
            return false
        }
    }
    return true
}

func selectLine(idx: Int, cnt: Int, n: Int, h: Int, map: inout [[Bool]], answer: inout Int) {
    if cnt >= answer { 
        return
    }
    
    if ladderGame(n: n, h: h, map: map) {
        answer = min(answer, cnt)
        return
    }
    
    for i in idx...h {
        for j in 1..<n {
            if map[j][i] || map[j - 1][i] || map[j + 1][i] {
                continue
            }
            
            map[j][i] = true
            selectLine(idx: i, cnt: cnt + 1, n: n, h: h, map: &map, answer: &answer)
            map[j][i] = false

            if answer == cnt + 1 { 
                return
            }
        }
    }
}

func solution(n: Int, h: Int, map: inout [[Bool]]) -> Int {
    var answer = 4 
    selectLine(idx: 1, cnt: 0, n: n, h: h, map: &map, answer: &answer)
    
    return answer == 4 ? -1 : answer
}

func main() {
    let (n, _, h, map) = input()
    var mutableMap = map
    let result = solution(n: n, h: h, map: &mutableMap)
    print(result)
}

main()
