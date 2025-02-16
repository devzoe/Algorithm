import Foundation

func find(_ arr: inout [Int], _ x: Int) -> Int {
    if arr[x] != x { arr[x] = find(&arr, arr[x]) }
    return arr[x]
}

func union(_ arr: inout [Int], _ x: Int, _ y: Int) {
    let rootX = find(&arr, x)
    let rootY = find(&arr, y)
    if rootX == rootY { return }
    if rootX < rootY { arr[rootY] = rootX }
    else { arr[rootX] = rootY }
}

func isUnion(_ arr: inout [Int], _ x: Int, _ y: Int) -> Bool {
    let rootX = find(&arr, x)
    let rootY = find(&arr, y)
    return rootX == rootY
}

func main() {
    let n = Int(readLine()!)!
    let _ = Int(readLine()!)!
    var arr: [Int] = [Int](repeating: 0, count: n)
    arr.indices.forEach { arr[$0] = $0 }
    for i in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        if i == n-1 { break }
        for j in i+1..<line.count {
            if line[j] == 1 {
                union(&arr, i, j)
            }
        }
    }
    let path = readLine()!.split(separator: " ").map { Int($0)!-1 }
    var result = true
    for i in 0..<path.count-1 {
        if !isUnion(&arr, path[i], path[i+1]) {
            result = false
        }
    }
    result ? print("YES") : print("NO")
}
main()