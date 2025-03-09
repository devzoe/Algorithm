import Foundation

let ve = readLine()!.split(separator: " ").map { Int($0)! }
let (v,e) = (ve[0],ve[1])
var arr: [Int] = [Int](repeating: 0, count: v+1)
arr.indices.forEach { arr[$0] = $0 }

func find(_ x: Int) -> Int {
    if x != arr[x] { arr[x] = find(arr[x]) }
    return arr[x]
}

func union(_ x: Int, _ y: Int) {
    let x = find(x)
    let y = find(y)
    if x == y { return }
    if x < y { arr[y] = x}
    else { arr[x] = y }
}

var result: [Int] = []
var queue: [((Int,Int,Int))] = []
var cnt = 0
for _ in 0..<e {
    let n = readLine()!.split(separator: " ").map { Int($0)! }
    let (v1,v2,cost) = (n[0],n[1],n[2])
    queue.append((v1,v2,cost))
}
queue.sort{ $0.2 < $1.2 }
for i in 0..<e {
    if cnt == v-1 { break }
    let (v1,v2,cost) = queue[i]
    if find(v1) == find(v2) { continue }
    union(v1,v2)
    result.append(cost)
    cnt += 1
}
result.removeLast()
print(result.reduce(0,+))