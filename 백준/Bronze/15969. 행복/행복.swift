let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map { Int($0)! }
let max = arr.max()!
let min = arr.min()!
print(max-min)