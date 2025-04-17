import Foundation

let n = Int(readLine()!)!
var points = [(x: Int64, y: Int64)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int64($0)! }
    points.append((x: input[0], y: input[1]))
}

func ccw(_ a: (x: Int64, y: Int64), _ b: (x: Int64, y: Int64), _ c: (x: Int64, y: Int64)) -> Int64 {
    return a.x * b.y + b.x * c.y + c.x * a.y - (b.x * a.y + c.x * b.y + a.x * c.y)
}

var area: Double = 0
for i in 1..<n-1 {
    area += Double(ccw(points[0], points[i], points[i+1])) / 2.0
}

print(String(format: "%.1f", abs(area)))