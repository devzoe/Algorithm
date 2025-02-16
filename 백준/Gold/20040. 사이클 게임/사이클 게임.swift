import Foundation

func find(_ arr: inout [Int], _ x: Int) -> Int {
    if arr[x] != x { arr[x] = find(&arr, arr[x]) }
    return arr[x]
}

func union(_ arr: inout [Int], _ x: Int, _ y: Int) -> Bool {
    let rootX = find(&arr, x)
    let rootY = find(&arr, y)
    if rootX == rootY {
        return true
    }
    if rootX < rootY { arr[rootY] = rootX }
    else { arr[rootX] = rootY }
    return false
}

func main() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,m) = (nm[0],nm[1])
    var result = 0
    var arr: [Int] = [Int](repeating: 0, count: n)
    arr.indices.forEach { arr[$0] = $0 }
    for i in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        if union(&arr, line[0], line[1]) {
            result = i + 1
            break
        }
    }
    print(result)
}
main()