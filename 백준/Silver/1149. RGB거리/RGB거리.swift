let n = Int(readLine()!)!
var costs: [[Int]] = Array(repeating: [0,0,0], count: n)
var rgb: [[Int]] = []
for _ in 0..<n {
    rgb.append(readLine()!.split(separator: " ").map { Int($0)! })
}

costs[0] = rgb[0]

for i in 1..<n {
    costs[i][0] = rgb[i][0] + min(costs[i-1][1], costs[i-1][2])
    costs[i][1] = rgb[i][1] + min(costs[i-1][0], costs[i-1][2])
    costs[i][2] = rgb[i][2] + min(costs[i-1][0], costs[i-1][1])
}
print(costs[n-1].min()!)