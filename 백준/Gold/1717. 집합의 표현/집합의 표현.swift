import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let n = line[0]
let m = line[1]

var parent = [Int](repeating: 0, count: n + 1)
for i in 0...n {
    parent[i] = i
}

func findParent(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = findParent(parent[x])
    }
    return parent[x]
}

func unionParent(_ a: Int, _ b: Int) {
    let aRoot = findParent(a)
    let bRoot = findParent(b)
    if aRoot < bRoot {
        parent[bRoot] = aRoot
    } else {
        parent[aRoot] = bRoot
    }
}

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let cmd = line[0]
    let a = line[1]
    let b = line[2]

    if cmd == 0 {
        unionParent(a, b)
    } else {
        if findParent(a) == findParent(b) {
            print("YES")
        } else {
            print("NO")
        }
    }
}
