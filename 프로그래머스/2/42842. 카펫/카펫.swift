func solution(_ brown: Int, _ yellow: Int) -> [Int] {
    var answer: [Int] = []
    var n: [Int] = []
    
    for i in 1...yellow {
        if yellow % i == 0 {
            n.append(i)
        }
    }
    
    let length = n.count / 2
    var h: [Int] = []
    var w: [Int] = []
    
    if n.count % 2 == 0 {
        h = Array(n[0..<length])
        w = Array(n[length..<n.count])
    } else {
        h = Array(n[0...length])
        w = Array(n[length..<n.count])
    }
    
    for i in 0..<h.count {
        if brown == 2 * (w[w.count - i - 1] + h[i]) + 4 {
            answer = [w[w.count - i - 1] + 2, h[i] + 2]
            break
        }
    }
    
    return answer
}
