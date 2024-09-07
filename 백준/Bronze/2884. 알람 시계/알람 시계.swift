let line = readLine()!.split(separator: " ").map { Int($0)! }
let h = line[0] + 24, m = line[1] + 60

let M = (m - 45) % 60
var H = (m - 45) / 60 == 0 ? h - 1 : h
H = H % 24
print(H, M)
