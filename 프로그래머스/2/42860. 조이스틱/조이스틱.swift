import Foundation

func solution(_ name: String) -> Int {
    let nameArr = Array(name)
    let n = nameArr.count
    var ch = 0
    
    // 문자 이동
    for char in nameArr {
        let idx = Int(char.asciiValue! - Character("A").asciiValue!)
        ch += min(idx, 26 - idx)
    }
    
    // 위치 이동
    var move = n - 1
    for i in 0..<n {
        var next = i + 1
        while next < n && nameArr[next] == "A" {
            next += 1
        }
        
        // 각 위치에서 왼쪽으로 돌아가거나 우회하여 이동하는 경로 고려
        move = min(move, 2 * i + n - next, i + 2 * (n - next))
    }
    
    return ch + move
}