let line = readLine()!.split(separator: " ").map { Int($0)! }
let h = line[0], m = line[1]
let time = Int(readLine()!)!
let M = (m + time) % 60
let H = (h + ((m + time)/60)) % 24
print(H, M)