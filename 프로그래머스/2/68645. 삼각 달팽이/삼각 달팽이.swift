func solution(_ n: Int) -> [Int] {
    var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    var x = -1
    var y = 0
    var num = 1
    
    for i in 0..<n {
        for j in i..<n {
            if i % 3 == 0 { // 아래로 이동
                x += 1
            } else if i % 3 == 1 { // 오른쪽으로 이동
                y += 1
            } else { // 대각선 위로 이동
                x -= 1
                y -= 1
            }
            arr[x][y] = num
            num += 1
        }
    }
    
    var result = [Int]()
    for i in 0..<n {
        for j in 0...i {
            result.append(arr[i][j])
        }
    }
    
    return result
}