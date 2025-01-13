let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (line[0],line[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var p: [Int] = [Int](repeating: 0, count: n+1)
for i in 1...n {
    p[i] = p[i-1] + arr[i-1]
}
var dict: [Int:Int] = [p[0]:1]
var result = 0
for i in 1...n {
    result += dict[p[i]-k, default: 0]
    dict[p[i], default: 0] += 1
}
print(result)