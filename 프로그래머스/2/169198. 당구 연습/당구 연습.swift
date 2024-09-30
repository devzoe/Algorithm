import Foundation

func solution(_ m: Int, _ n: Int, _ startX: Int, _ startY: Int, _ balls: [[Int]]) -> [Int] {
    var answer: [Int] = Array(repeating: 0, count: balls.count)
    
    let x1 = startX
    let y1 = startY
    
    for (index, ball) in balls.enumerated() {
        let x2 = ball[0]
        let y2 = ball[1]
        
        if x1 == x2 {
            let d1 = (y2 - y1) * (y2 - y1) + 4 * x1 * x1
            let d2 = (y2 - y1) * (y2 - y1) + 4 * (m - x1) * (m - x1)
            let d3 = y1 < y2 ? (y1 + y2) * (y1 + y2) : (2 * n - y1 - y2) * (2 * n - y1 - y2)
            answer[index] = min(d1, d2, d3)
        } else if y1 == y2 {
            let d1 = (x2 - x1) * (x2 - x1) + 4 * y1 * y1
            let d2 = (x2 - x1) * (x2 - x1) + 4 * (n - y1) * (n - y1)
            let d3 = x1 < x2 ? (x1 + x2) * (x1 + x2) : (2 * m - x1 - x2) * (2 * m - x1 - x2)
            answer[index] = min(d1, d2, d3)
        } else {
            let d1 = (x2 - x1) * (x2 - x1) + (y2 + y1) * (y2 + y1)
            let d2 = (x2 + x1) * (x2 + x1) + (y2 - y1) * (y2 - y1)
            let d3 = (y2 - y1) * (y2 - y1) + (2 * m - x1 - x2) * (2 * m - x1 - x2)
            let d4 = (x2 - x1) * (x2 - x1) + (2 * n - y1 - y2) * (2 * n - y1 - y2)
            answer[index] = min(d1, d2, d3, d4)
        }
    }
    
    return answer
}
