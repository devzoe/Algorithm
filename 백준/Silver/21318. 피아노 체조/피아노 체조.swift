let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var p: [Int] = [Int](repeating: 0, count: n+1)
for i in 1..<n {
    p[i] = p[i-1]
    if arr[i-1] > arr[i] {
        p[i] += 1
    }
}
let k = Int(readLine()!)!
for _ in 0..<k {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (x,y) = (line[0],line[1])
    print(p[y-1]-p[x-1])
}